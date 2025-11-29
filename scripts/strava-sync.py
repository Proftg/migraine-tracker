import os
import sys
import json
import time
from datetime import datetime, timedelta
from dotenv import load_dotenv
from supabase import create_client
from stravalib.client import Client

# Load environment variables
load_dotenv(".env.strava")
load_dotenv(".env.local")  # Fallback for Supabase credentials

# Configuration
STRAVA_CLIENT_ID = os.getenv("STRAVA_CLIENT_ID")
STRAVA_CLIENT_SECRET = os.getenv("STRAVA_CLIENT_SECRET")
STRAVA_REFRESH_TOKEN = os.getenv("STRAVA_REFRESH_TOKEN")

SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("NEXT_PUBLIC_SUPABASE_ANON_KEY")

def log(msg):
    print(f"[{datetime.now().strftime('%H:%M:%S')}] {msg}", flush=True)

def setup_supabase():
    if not SUPABASE_URL or not SUPABASE_KEY:
        log("❌ Supabase credentials missing!")
        sys.exit(1)
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def setup_strava():
    if not STRAVA_CLIENT_ID or not STRAVA_CLIENT_SECRET or not STRAVA_REFRESH_TOKEN:
        log("❌ Strava credentials missing! Check .env.strava")
        sys.exit(1)
    
    client = Client()
    
    # Refresh token to get a valid access token
    try:
        log("🔄 Refreshing Strava access token...")
        refresh_response = client.refresh_access_token(
            client_id=STRAVA_CLIENT_ID,
            client_secret=STRAVA_CLIENT_SECRET,
            refresh_token=STRAVA_REFRESH_TOKEN
        )
        client.access_token = refresh_response['access_token']
        log("✅ Strava authenticated successfully!")
        return client
    except Exception as e:
        log(f"❌ Strava authentication failed: {e}")
        sys.exit(1)

def sync_activities(strava_client, supabase):
    # Fetch activities from the last 7 days
    after_date = datetime.now() - timedelta(days=7)
    log(f"📥 Fetching activities since {after_date.strftime('%Y-%m-%d %H:%M:%S')}...")
    
    activities_list = list(strava_client.get_activities(after=after_date))
    log(f"📊 Found {len(activities_list)} activities from Strava")
    
    count = 0
    for activity in activities_list:
        try:
            log(f"🔍 Processing: {activity.name} (ID: {activity.id}, Date: {activity.start_date_local})")
            
            # Prepare data for Supabase
            activity_date = activity.start_date_local.isoformat()
            
            # Handle duration (can be timedelta or int)
            duration_minutes = 0
            if hasattr(activity.moving_time, 'total_seconds'):
                duration_minutes = activity.moving_time.total_seconds() / 60
            else:
                duration_minutes = int(activity.moving_time) / 60

            # Map Strava activity to our ActivityEntry structure
            # Extract clean activity type (handle both string and object types)
            activity_type_str = str(activity.type)
            if "root=" in activity_type_str:
                # Extract from format like "root='WeightTraining'"
                activity_type_clean = activity_type_str.split("'")[1] if "'" in activity_type_str else activity_type_str
            else:
                activity_type_clean = activity_type_str
            
            # Map Strava types to French names
            type_mapping = {
                'WeightTraining': 'Musculation',
                'Run': 'Course à pieds',
                'Ride': 'Vélo',
                'VirtualRun': 'Course virtuelle',
                'VirtualRide': 'Vélo virtuel',
                'Swim': 'Natation',
                'Walk': 'Marche',
                'Hike': 'Randonnée'
            }
            activity_type_display = type_mapping.get(activity_type_clean, activity_type_clean)
            
            # Determine intensity based on suffer score
            intensity = None
            if activity.suffer_score:
                if activity.suffer_score > 80:
                    intensity = 'high'
                elif activity.suffer_score > 40:
                    intensity = 'medium'
                else:
                    intensity = 'low'
            
            entry = {
                "id": f"strava_{activity.id}",
                "date": activity_date,
                "type": "activity",
                "activityType": activity_type_display,
                "duration": int(round(duration_minutes)),
                "intensity": intensity,
                "notes": f"{activity.name} (Strava)",
                
                # Strava specific fields
                "stravaId": str(activity.id),
                "averageHeartRate": int(activity.average_heartrate) if activity.average_heartrate else None,
                "maxHeartRate": int(activity.max_heartrate) if activity.max_heartrate else None,
                "elevationGain": int(activity.total_elevation_gain) if activity.total_elevation_gain else None,
                "sufferScore": int(activity.suffer_score) if activity.suffer_score else None,
                
                # Mapping to existing fields
                "caloriesBurned": int(activity.kilojoules) if activity.kilojoules else None,
                "distance": float(activity.distance) if activity.distance else None
            }
            
            # Insert into Supabase
            # Note: We use upsert to avoid duplicates
            result = supabase.table("journal_entries").upsert(entry).execute()
            log(f"✅ Synced activity: {activity.name} ({activity.type})")
            count += 1
            
        except Exception as e:
            log(f"⚠️ Failed to sync activity {activity.id}: {e}")
            import traceback
            traceback.print_exc()
    
    if count == 0:
        log("ℹ️ No new activities found.")
    else:
        log(f"🎉 Successfully synced {count} activities!")

if __name__ == "__main__":
    print("============================================================")
    print("🚴 Strava Activity Sync")
    print("============================================================")
    
    supabase = setup_supabase()
    strava = setup_strava()
    sync_activities(strava, supabase)
    
    print("============================================================")
