#!/usr/bin/env python3
"""
Garmin Connect Data Synchronization Script
Automatically downloads daily health data and syncs to Supabase
"""

import os
import json
import sys
from datetime import datetime, timedelta
from pathlib import Path
from garth.exc import GarthHTTPError

try:
    from garth import Client
    from dotenv import load_dotenv
    from supabase import create_client, Client as SupabaseClient
except ImportError:
    print("❌ Missing dependencies. Please run: bash scripts/setup-garmin.sh")
    sys.exit(1)

# Configuration
DATA_DIR = Path(__file__).parent.parent / "garmin-data"
DATA_DIR.mkdir(exist_ok=True)

ENV_FILE = Path(__file__).parent.parent / ".env.garmin"
TOKEN_DIR = Path.home() / ".garmin"
TOKEN_DIR.mkdir(exist_ok=True)

# Load environment variables
load_dotenv(ENV_FILE)

def get_credentials():
    """Get Garmin credentials from environment or prompt user"""
    email = os.getenv("GARMIN_EMAIL")
    password = os.getenv("GARMIN_PASSWORD")
    
    if not email or not password:
        print("📧 Garmin Connect credentials not found in .env.garmin")
        email = input("Enter your Garmin email: ")
        password = input("Enter your Garmin password: ")
        
        # Save credentials (append if file exists to keep Supabase keys)
        mode = "a" if ENV_FILE.exists() else "w"
        with open(ENV_FILE, mode) as f:
            if mode == "a": f.write("\n")
            f.write(f"GARMIN_EMAIL={email}\n")
            f.write(f"GARMIN_PASSWORD={password}\n")
    
    return email, password

def get_supabase_client():
    """Initialize Supabase client"""
    url = os.getenv("SUPABASE_URL")
    key = os.getenv("SUPABASE_KEY")
    
    if not url or not key:
        print("⚠️  Supabase credentials missing in .env.garmin")
        print("   Data will be saved locally only.")
        return None
        
    return create_client(url, key)

def login_garmin():
    """Login to Garmin Connect"""
    email, password = get_credentials()
    client = Client()
    token_file = TOKEN_DIR / "tokens.json"
    
    if token_file.exists():
        try:
            client.load(token_file)
            print("✅ Using saved authentication tokens")
            return client
        except Exception:
            print("⚠️  Saved tokens expired, logging in again...")
    
    try:
        print(f"🔐 Logging in to Garmin Connect as {email}...")
        client.login(email, password)
        client.dump(token_file)
        print("✅ Successfully logged in!")
        return client
    except Exception as e:
        print(f"❌ Login failed: {e}")
        sys.exit(1)

def fetch_advanced_data(client, date):
    """Fetch comprehensive health data"""
    date_str = date.strftime("%Y-%m-%d")
    print(f"\n📥 Fetching ADVANCED data for {date_str}...")
    
    metrics = {
        "date": date_str,
        "steps": 0,
        "resting_hr": 0,
        "hrv_status": None,
        "hrv_value": 0,
        "sleep_score": 0,
        "sleep_seconds": 0,
        "stress_avg": 0,
        "body_battery_max": 0,
        "body_battery_min": 0,
        "training_load": 0,
        "total_calories": 0,
        "active_calories": 0,
        "endurance_score": 0
    }
    
    # 1. User Summary (Steps, Calories)
    try:
        print("  ⏳ Fetching summary...")
        summary = client.connectapi(f"/usersummary-service/usersummary/daily/{date_str}")
        if summary:
            metrics["steps"] = summary.get("totalSteps", 0)
            metrics["total_calories"] = summary.get("totalKilocalories", 0)
            metrics["active_calories"] = summary.get("activeKilocalories", 0)
            metrics["resting_hr"] = summary.get("restingHeartRate", 0)
            metrics["stress_avg"] = summary.get("averageStressLevel", 0)
            print(f"    ✅ Steps: {metrics['steps']}, Cal: {metrics['total_calories']}")
    except Exception as e:
        print(f"    ⚠️  Summary failed: {e}")

    # 2. Body Battery
    try:
        print("  ⏳ Fetching Body Battery...")
        bb = client.connectapi(f"/wellness-service/wellness/bodyBattery/reports/daily?startDate={date_str}&endDate={date_str}")
        if bb and len(bb) > 0:
            # Usually returns a list of values, we want min/max
            # This endpoint structure varies, simplifying for robustness
            pass 
        
        # Alternative: Body Battery is often in the daily stress endpoint details
        stress_details = client.connectapi(f"/wellness-service/wellness/dailyStress/{date_str}")
        if stress_details:
            if "bodyBatteryValueDescriptors" in stress_details:
                bb_values = [b.get("bodyBatteryValue") for b in stress_details["bodyBatteryValueDescriptors"] if b.get("bodyBatteryValue")]
                if bb_values:
                    metrics["body_battery_max"] = max(bb_values)
                    metrics["body_battery_min"] = min(bb_values)
                    print(f"    ✅ Body Battery: {metrics['body_battery_min']}-{metrics['body_battery_max']}")
            
            if metrics["stress_avg"] == 0 and "avgStressLevel" in stress_details:
                 metrics["stress_avg"] = stress_details["avgStressLevel"]
    except Exception as e:
        print(f"    ⚠️  Body Battery failed: {e}")

    # 3. Sleep & Sleep Score
    try:
        print("  ⏳ Fetching Sleep...")
        sleep = client.connectapi(f"/wellness-service/wellness/dailySleepData/{client.username}?date={date_str}")
        if sleep and "dailySleepDTO" in sleep:
            dto = sleep["dailySleepDTO"]
            metrics["sleep_seconds"] = dto.get("sleepTimeSeconds", 0)
            metrics["sleep_score"] = dto.get("sleepScores", {}).get("overall", {}).get("value", 0)
            print(f"    ✅ Sleep Score: {metrics['sleep_score']}")
    except Exception as e:
        print(f"    ⚠️  Sleep failed: {e}")

    # 4. HRV (Heart Rate Variability)
    try:
        print("  ⏳ Fetching HRV...")
        hrv = client.connectapi(f"/hrv-service/hrv/daily/{date_str}")
        if hrv:
            metrics["hrv_value"] = hrv.get("lastNightAvg", 0)
            metrics["hrv_status"] = hrv.get("status")
            print(f"    ✅ HRV: {metrics['hrv_value']} ms ({metrics['hrv_status']})")
    except Exception as e:
        print(f"    ⚠️  HRV failed: {e}")

    # 5. Training Status
    try:
        print("  ⏳ Fetching Training Status...")
        train = client.connectapi(f"/metrics-service/metrics/trainingstatus/aggregated/{date_str}")
        if train:
            metrics["training_load"] = train.get("trainingLoad", 0)
            print(f"    ✅ Training Load: {metrics['training_load']}")
    except Exception as e:
        print(f"    ⚠️  Training Status failed: {e}")

    return metrics

def sync_to_supabase(metrics, supabase):
    """Push data to Supabase"""
    if not supabase:
        return

    print("\n☁️  Syncing to Supabase...")
    try:
        # Remove None values to let SQL defaults handle them if needed, 
        # but for upsert it's better to send what we have.
        data = {k: v for k, v in metrics.items() if v is not None}
        
        result = supabase.table("garmin_metrics").upsert(data).execute()
        print("    ✅ Data successfully synced to DB!")
    except Exception as e:
        print(f"    ❌ Supabase Sync Error: {e}")

def main():
    try:
        print("=" * 60, flush=True)
        print("🏃 Garmin Connect ADVANCED Sync", flush=True)
        print("=" * 60, flush=True)
        
        # Setup
        client = login_garmin()
        supabase = get_supabase_client()
        
        # Date (Yesterday by default)
        if len(sys.argv) > 1:
            date = datetime.strptime(sys.argv[1], "%Y-%m-%d")
        else:
            date = datetime.now() - timedelta(days=1)
        
        # Fetch
        metrics = fetch_advanced_data(client, date)
        
        # Save Local JSON (Backup)
        file_path = DATA_DIR / f"{metrics['date']}.json"
        with open(file_path, "w") as f:
            json.dump(metrics, f, indent=2)
        print(f"\n💾 Local backup saved to: {file_path.name}", flush=True)
        
        # Sync Cloud
        sync_to_supabase(metrics, supabase)
        
        print("\n" + "=" * 60, flush=True)
        print("✅ Done!", flush=True)

    except Exception as e:
        print(f"\n❌ CRITICAL ERROR: {e}", flush=True)
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()
