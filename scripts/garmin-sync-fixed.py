#!/usr/bin/env python3
"""
Script de synchronisation Garmin corrigé - utilise uniquement les endpoints fonctionnels
Version: 2.0 - Décembre 2025
"""
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
    
    # Check if running non-interactively (from API)
    is_interactive = sys.stdin.isatty()
    
    try:
        garth.resume(garth_dir)
        try:
            garth.client.username
            print("✅ Using saved Garmin session")
        except:
            if not is_interactive:
                print("❌ Error: Session expired and cannot login interactively")
                print("Please run 'python3 scripts/garmin-sync-fixed.py' manually first to authenticate")
                sys.exit(1)
            print("Session expired, logging in again...")
            garth.login(GARMIN_EMAIL, GARMIN_PASSWORD)
            garth.save(garth_dir)
    except FileNotFoundError:
        if not is_interactive:
            print("❌ Error: No Garmin session found")
            print("Please run 'python3 scripts/garmin-sync-fixed.py' manually first to authenticate with MFA")
            sys.exit(1)
        print("No session found, logging in...")
        garth.login(GARMIN_EMAIL, GARMIN_PASSWORD)
        garth.save(garth_dir)
    except Exception as e:
        print(f"❌ Error logging in: {e}")
        if not is_interactive:
            print("Cannot login interactively. Please run manually first.")
            sys.exit(1)
        try:
            print("Attempting fresh login...")
            garth.login(GARMIN_EMAIL, GARMIN_PASSWORD)
            garth.save(garth_dir)
        except Exception as e2:
            print(f"❌ Fatal login error: {e2}")
            sys.exit(1)

def sync_garmin():
    print("🚀 Starting Garmin Sync (Fixed Version)...")
    
    supabase = setup_supabase()
    login_garmin()
    
    username = garth.client.username
    print(f"👤 Syncing for user: {username}")
    
    # Sync last 30 days
    today = date.today()
    
    print(f"📅 Fetching data for last 30 days (up to {today})")
    
    synced_count = 0
    error_count = 0
    
    try:
        for i in range(30):
            day = today - timedelta(days=i)
            day_str = day.isoformat()
            
            try:
                # ==================================================================
                # ENDPOINT 1: USER SUMMARY (Steps, Calories, Distance)
                # ==================================================================
                user_summary = None
                steps = None
                total_calories = None
                active_calories = None
                distance_meters = None
                
                try:
                    user_summary = garth.connectapi(
                        f"/usersummary-service/usersummary/daily/{username}",
                        params={"calendarDate": day_str}
                    )
                    if user_summary:
                        steps = user_summary.get('totalSteps')
                        total_calories = user_summary.get('totalKilocalories')
                        active_calories = user_summary.get('activeKilocalories')
                        distance_meters = user_summary.get('totalDistanceMeters')
                except Exception as e:
                    print(f"⚠️  User summary error for {day_str}: {e}")
                
                # ==================================================================
                # ENDPOINT 2: SLEEP DATA
                # ==================================================================
                sleep_score = None
                sleep_seconds = None
                deep_sleep_seconds = None
                light_sleep_seconds = None
                rem_sleep_seconds = None
                awake_seconds = None
                
                try:
                    sleep_data = garth.connectapi(
                        f"/wellness-service/wellness/dailySleepData/{username}",
                        params={"date": day_str}
                    )
                    if sleep_data and 'dailySleepDTO' in sleep_data:
                        sleep_dto = sleep_data['dailySleepDTO']
                        sleep_score = sleep_dto.get('sleepScores', {}).get('overall', {}).get('value')
                        sleep_seconds = sleep_dto.get('sleepTimeSeconds')
                        
                        # Sleep levels breakdown
                        sleep_levels = sleep_data.get('sleepLevels')
                        if sleep_levels:
                            for level in sleep_levels:
                                level_key = level.get('activityLevel')
                                duration = level.get('sleepLevelSeconds', 0)
                                
                                if level_key == 'deep':
                                    deep_sleep_seconds = duration
                                elif level_key == 'light':
                                    light_sleep_seconds = duration
                                elif level_key == 'rem':
                                    rem_sleep_seconds = duration
                                elif level_key == 'awake':
                                    awake_seconds = duration
                except Exception as e:
                    print(f"⚠️  Sleep data error for {day_str}: {e}")
                
                # ==================================================================
                # ENDPOINT 3: STRESS DATA
                # ==================================================================
                avg_stress = None
                max_stress = None
                
                try:
                    stress_data = garth.connectapi(
                        f"/wellness-service/wellness/dailyStress/{day_str}"
                    )
                    if stress_data:
                        avg_stress = stress_data.get('avgStressLevel')
                        max_stress = stress_data.get('maxStressLevel')
                except Exception as e:
                    print(f"⚠️  Stress data error for {day_str}: {e}")
                
                # ==================================================================
                # ENDPOINT 4: HEART RATE
                # ==================================================================
                resting_hr = None
                min_hr = None
                max_hr = None
                avg_hr_7days = None
                
                try:
                    hr_data = garth.connectapi(
                        f"/wellness-service/wellness/dailyHeartRate/{username}",
                        params={"date": day_str}
                    )
                    if hr_data:
                        resting_hr = hr_data.get('restingHeartRate')
                        min_hr = hr_data.get('minHeartRate')
                        max_hr = hr_data.get('maxHeartRate')
                        avg_hr_7days = hr_data.get('lastSevenDaysAvgRestingHeartRate')
                except Exception as e:
                    print(f"⚠️  Heart rate error for {day_str}: {e}")
                
                # ==================================================================
                # PREPARE DATA FOR UPSERT
                # ==================================================================
                data_to_upsert = {
                    "date": day_str,
                    # Sleep metrics
                    "sleep_score": sleep_score,
                    "sleep_seconds": sleep_seconds,
                    "deep_sleep_seconds": deep_sleep_seconds,
                    "light_sleep_seconds": light_sleep_seconds,
                    "rem_sleep_seconds": rem_sleep_seconds,
                    "awake_seconds": awake_seconds,
                    # Stress metrics
                    "stress_avg": avg_stress,
                    "stress_max": max_stress,
                    # Heart rate metrics
                    "resting_hr": resting_hr,
                    "min_hr": min_hr,
                    "max_hr": max_hr,
                    "avg_hr_7days": avg_hr_7days,
                    # Activity metrics
                    "steps": steps,
                    "calories_total": total_calories,
                    "calories_active": active_calories,
                    "distance_meters": distance_meters,
                    # Body Battery - Removed (endpoint not available)
                    # "body_battery_max": None,
                    # "body_battery_min": None,
                    # Training load - Not available in current endpoints
                    # "training_load": None,
                }
                
                # Remove None values
                data_to_upsert = {k: v for k, v in data_to_upsert.items() if v is not None}
                
                # Only upsert if we have some data
                if len(data_to_upsert) > 1:  # More than just the date
                    supabase.table('garmin_metrics').upsert(
                        data_to_upsert,
                        on_conflict='date'
                    ).execute()
                    
                    # Format output message
                    metrics = []
                    if sleep_score:
                        metrics.append(f"Sleep={sleep_score}")
                    if avg_stress:
                        metrics.append(f"Stress={avg_stress}")
                    if resting_hr:
                        metrics.append(f"HR={resting_hr}")
                    if steps:
                        metrics.append(f"Steps={steps}")
                    
                    print(f"✅ {day_str}: {', '.join(metrics)}")
                    synced_count += 1
                else:
                    print(f"⚠️  No data for {day_str}")
                    
            except Exception as e:
                print(f"❌ Error syncing {day_str}: {e}")
                error_count += 1
                continue
            
    except Exception as e:
        print(f"❌ Fatal error during sync: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

    # Summary
    print(f"\n{'='*80}")
    print(f"🎉 Sync complete!")
    print(f"✅ Successfully synced: {synced_count} days")
    if error_count > 0:
        print(f"❌ Errors encountered: {error_count} days")
    print(f"{'='*80}\n")

if __name__ == "__main__":
    sync_garmin()
