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
    # Fetch activities from yesterday and today
    after_date = datetime.now() - timedelta(days=2)
    log(f"📥 Fetching activities since {after_date.strftime('%Y-%m-%d')}...")
    
    activities = strava_client.get_activities(after=after_date)
    
    count = 0
    for activity in activities:
        try:
            # Prepare data for Supabase
            activity_date = activity.start_date_local.isoformat()
            
            # Handle duration (can be timedelta or int)
            duration_minutes = 0
            if hasattr(activity.moving_time, 'total_seconds'):
                duration_minutes = activity.moving_time.total_seconds() / 60
            else:
                duration_minutes = int(activity.moving_time) / 60

            # Map Strava activity to our ActivityEntry structure
            entry = {
                "id": f"strava_{activity.id}",
                "date": activity_date,
                "type": "activity",
                "activityType": activity.type,
                "duration": duration_minutes, # Minutes
                "notes": f"{activity.name} (Imported from Strava)",
                
                # Strava specific fields (need to be supported by DB)
                "stravaId": str(activity.id),
                "averageHeartRate": activity.average_heartrate,
                "maxHeartRate": activity.max_heartrate,
                "elevationGain": float(activity.total_elevation_gain),
                "sufferScore": activity.suffer_score,
                
                # Mapping to existing fields
                "caloriesBurned": activity.kilojoules, # Approx if calories not available
                "distance": float(activity.distance) # Meters
            }
            
            # Insert into Supabase
            # Note: We use upsert to avoid duplicates
            data, _ = supabase.table("journal_entries").upsert(entry).execute()
            log(f"✅ Synced activity: {activity.name} ({activity.type})")
            count += 1
            
        except Exception as e:
            log(f"⚠️ Failed to sync activity {activity.id}: {e}")
    
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
