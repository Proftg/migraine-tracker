#!/usr/bin/env python3
import os
import sys
import json
import time
import re
from datetime import datetime, timedelta
from dotenv import load_dotenv
from supabase import create_client
from stravalib.client import Client

# Load environment variables
load_dotenv('.env.strava')
load_dotenv('.env.local')

# Configuration
STRAVA_CLIENT_ID = os.getenv('STRAVA_CLIENT_ID')
STRAVA_CLIENT_SECRET = os.getenv('STRAVA_CLIENT_SECRET')
STRAVA_REFRESH_TOKEN = os.getenv('STRAVA_REFRESH_TOKEN')
SUPABASE_URL = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
SUPABASE_KEY = os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')

def setup_strava():
    client = Client()
    if not STRAVA_REFRESH_TOKEN:
        print("Error: STRAVA_REFRESH_TOKEN not found")
        sys.exit(1)
        
    refresh_response = client.refresh_access_token(
        client_id=STRAVA_CLIENT_ID,
        client_secret=STRAVA_CLIENT_SECRET,
        refresh_token=STRAVA_REFRESH_TOKEN
    )
    client.access_token = refresh_response['access_token']
    return client

def setup_supabase():
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def sync_activities():
    print("Starting Strava sync...")
    strava = setup_strava()
    supabase = setup_supabase()
    
    # Get activities from last 7 days to be safe
    start_date = datetime.now() - timedelta(days=7)
    activities = strava.get_activities(after=start_date)
    
    synced_count = 0
    
    for activity in activities:
        try:
            # Parse dates
            activity_date = activity.start_date_local.isoformat()
            
            # Calculate duration in minutes
            duration_minutes = 0
            if activity.moving_time:
                if hasattr(activity.moving_time, 'total_seconds'):
                    duration_minutes = int(activity.moving_time.total_seconds() / 60)
                else:
                    duration_minutes = int(activity.moving_time / 60)
            elif hasattr(activity, 'elapsed_time'):
                if hasattr(activity.elapsed_time, 'total_seconds'):
                    duration_minutes = int(activity.elapsed_time.total_seconds() / 60)
                else:
                    duration_minutes = int(activity.elapsed_time / 60)

            # Clean activity type
            activity_type_str = str(activity.type)
            activity_type_clean = activity_type_str
            
            # Regex to extract name from root='Name' or similar patterns
            match = re.search(r"root='([^']+)'", activity_type_str)
            if match:
                activity_type_clean = match.group(1)
            else:
                # Fallback for simple string or other formats
                activity_type_clean = activity_type_str.replace("root=", "").replace("'", "")

            # Map to French
            type_mapping = {
                'WeightTraining': 'Musculation',
                'Run': 'Course à pieds',
                'Ride': 'Vélo',
                'VirtualRun': 'Course virtuelle',
                'VirtualRide': 'Vélo virtuel',
                'Swim': 'Natation',
                'Walk': 'Marche',
                'Hike': 'Randonnée',
                'Workout': 'Entraînement',
                'Yoga': 'Yoga',
                'Crossfit': 'Crossfit'
            }
            activity_type_display = type_mapping.get(activity_type_clean, activity_type_clean)
            
            # Determine intensity
            intensity = 'medium'
            if activity.suffer_score:
                if activity.suffer_score > 80:
                    intensity = 'high'
                elif activity.suffer_score < 40:
                    intensity = 'low'
            
            entry = {
                "id": f"strava_{activity.id}",
                "date": activity_date,
                "type": "activity",
                "activityType": activity_type_display,
                "duration": duration_minutes,
                "intensity": intensity,
                "notes": f"{activity.name} (Strava)",
                
                # Strava specific fields
                "stravaId": str(activity.id),
                "averageHeartRate": int(activity.average_heartrate) if activity.average_heartrate else None,
                "maxHeartRate": int(activity.max_heartrate) if activity.max_heartrate else None,
                "elevationGain": int(activity.total_elevation_gain) if activity.total_elevation_gain else None,
                "sufferScore": int(activity.suffer_score) if activity.suffer_score else None,
                
                "caloriesBurned": int(activity.kilojoules) if hasattr(activity, 'kilojoules') and activity.kilojoules else None,
                "distance": float(activity.distance) if activity.distance else None
            }
            
            # Upsert to Supabase
            supabase.table('journal_entries').upsert(entry).execute()
            print(f"Synced: {activity.name} ({activity_type_display})")
            synced_count += 1
            
        except Exception as e:
            print(f"Error syncing activity {activity.id}: {e}")
            import traceback
            traceback.print_exc()
            
    print(f"Sync complete. {synced_count} activities synced.")

if __name__ == "__main__":
    sync_activities()
