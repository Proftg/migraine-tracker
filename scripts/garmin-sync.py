#!/usr/bin/env python3
import os
import sys
from datetime import date, timedelta
from dotenv import load_dotenv
from supabase import create_client
import garth

# Load environment variables
load_dotenv('.env.garmin')
load_dotenv('.env.local')

GARMIN_EMAIL = os.getenv('GARMIN_EMAIL')
GARMIN_PASSWORD = os.getenv('GARMIN_PASSWORD')
SUPABASE_URL = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
SUPABASE_KEY = os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')

def setup_supabase():
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("❌ Error: Supabase credentials missing")
        sys.exit(1)
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def login_garmin():
    if not GARMIN_EMAIL or not GARMIN_PASSWORD:
        print("❌ Error: Garmin credentials missing in .env.garmin")
        sys.exit(1)
    
    home_dir = os.path.expanduser("~")
    garth_dir = os.path.join(home_dir, ".garth")
    
    try:
        garth.resume(garth_dir)
        try:
            garth.client.username
            print("✅ Using saved Garmin session")
        except:
            print("Session expired, logging in again...")
            garth.login(GARMIN_EMAIL, GARMIN_PASSWORD)
            garth.save(garth_dir)
    except FileNotFoundError:
        print("No session found, logging in...")
        garth.login(GARMIN_EMAIL, GARMIN_PASSWORD)
        garth.save(garth_dir)
    except Exception as e:
        print(f"❌ Error logging in: {e}")
        try:
            print("Attempting fresh login...")
            garth.login(GARMIN_EMAIL, GARMIN_PASSWORD)
            garth.save(garth_dir)
        except Exception as e2:
            print(f"❌ Fatal login error: {e2}")
            sys.exit(1)

def sync_garmin():
    print("🚀 Starting Garmin Sync...")
    
    supabase = setup_supabase()
    login_garmin()
    
    # Sync last 30 days
    today = date.today()
    
    print(f"Fetching data for last 30 days (up to {today})")
    
    synced_count = 0
    
    try:
        # Fetch user stats for the last 30 days
        for i in range(30):
            day = today - timedelta(days=i)
            day_str = day.isoformat()
            
            try:
                # Get daily stats
                stats = garth.connectapi(f"/usersummary-service/stats/daily/{day_str}")
                
                # Get sleep data
                sleep_data = garth.connectapi(f"/wellness-service/wellness/dailySleepData/{garth.client.username}",
                                             params={"date": day_str})
                
                # Extract metrics
                sleep_score = None
                sleep_seconds = None
                
                if sleep_data and 'dailySleepDTO' in sleep_data:
                    sleep_dto = sleep_data['dailySleepDTO']
                    sleep_score = sleep_dto.get('sleepScores', {}).get('overall', {}).get('value')
                    sleep_seconds = sleep_dto.get('sleepTimeSeconds')
                
                # Get stress data
                stress_data = garth.connectapi(f"/wellness-service/wellness/dailyStress/{day_str}")
                avg_stress = None
                if stress_data and 'avgStressLevel' in stress_data:
                    avg_stress = stress_data['avgStressLevel']
                
                # Get body battery
                body_battery_data = garth.connectapi(f"/wellness-service/wellness/bodyBattery/reports/daily/{day_str}/{day_str}")
                body_battery_max = None
                body_battery_min = None
                if body_battery_data and len(body_battery_data) > 0:
                    bb = body_battery_data[0]
                    body_battery_max = bb.get('charged')
                    body_battery_min = bb.get('drained')
                
                # Get training status for load
                training_load = None
                resting_hr = None
                
                if stats:
                    resting_hr = stats.get('restingHeartRate')
                    # Training load might be in different endpoints
                    # For now, we'll leave it as None and can add later
                
                # Prepare data for upsert
                data_to_upsert = {
                    "date": day_str,
                    "sleep_score": sleep_score,
                    "sleep_seconds": sleep_seconds,
                    "stress_avg": avg_stress,
                    "body_battery_max": body_battery_max,
                    "body_battery_min": body_battery_min,
                    "resting_hr": resting_hr,
                    "training_load": training_load
                }
                
                # Remove None values
                data_to_upsert = {k: v for k, v in data_to_upsert.items() if v is not None}
                
                # Only upsert if we have some data
                if len(data_to_upsert) > 1:  # More than just the date
                    supabase.table('garmin_metrics').upsert(data_to_upsert, on_conflict='date').execute()
                    print(f"✅ Synced {day_str}: Sleep={sleep_score}, Stress={avg_stress}, BB={body_battery_max}")
                    synced_count += 1
                else:
                    print(f"⚠️  No data for {day_str}")
                    
            except Exception as e:
                print(f"⚠️  Error syncing {day_str}: {e}")
                continue
            
    except Exception as e:
        print(f"❌ Error syncing data: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

    print(f"🎉 Sync complete! {synced_count} days processed.")

if __name__ == "__main__":
    sync_garmin()
