#!/usr/bin/env python3
"""
Script de diagnostic pour identifier les endpoints Garmin fonctionnels
"""
import os
import garth
from datetime import date, timedelta
from dotenv import load_dotenv

# Load environment variables
load_dotenv('.env.garmin')

def test_endpoint(endpoint, params=None, description=""):
    """Test un endpoint et affiche le résultat"""
    print(f"\n{'='*80}")
    print(f"🧪 Testing: {description}")
    print(f"   Endpoint: {endpoint}")
    if params:
        print(f"   Params: {params}")
    print(f"{'='*80}")
    
    try:
        result = garth.connectapi(endpoint, params=params)
        print(f"✅ SUCCESS!")
        print(f"📊 Response type: {type(result)}")
        
        if isinstance(result, dict):
            print(f"📊 Keys available: {list(result.keys())[:10]}")
        elif isinstance(result, list):
            print(f"📊 List length: {len(result)}")
            if len(result) > 0:
                print(f"📊 First item keys: {list(result[0].keys()) if isinstance(result[0], dict) else 'Not a dict'}")
        
        # Afficher un échantillon des données
        print(f"\n📄 Sample data:")
        import json
        print(json.dumps(result, indent=2, default=str)[:500])
        
        return True, result
    except Exception as e:
        print(f"❌ FAILED: {e}")
        return False, None

def main():
    print("🚀 Garmin Endpoint Diagnostic Tool")
    print("="*80)
    
    # Charger la session Garmin
    home_dir = os.path.expanduser("~")
    garth_dir = os.path.join(home_dir, ".garth")
    
    try:
        garth.resume(garth_dir)
        username = garth.client.username
        print(f"✅ Logged in as: {username}")
    except Exception as e:
        print(f"❌ Error loading Garmin session: {e}")
        print("Please run: python3 scripts/garmin-sync.py")
        return
    
    # Dates de test
    today = date.today()
    yesterday = today - timedelta(days=1)
    week_ago = today - timedelta(days=7)
    
    today_str = today.isoformat()
    yesterday_str = yesterday.isoformat()
    week_ago_str = week_ago.isoformat()
    
    print(f"\n📅 Testing dates:")
    print(f"   Today: {today_str}")
    print(f"   Yesterday: {yesterday_str}")
    print(f"   Week ago: {week_ago_str}")
    
    # Liste des endpoints à tester
    endpoints_to_test = [
        # User Summary
        {
            "endpoint": f"/usersummary-service/usersummary/daily/{username}",
            "params": {"calendarDate": yesterday_str},
            "description": "User Summary (Daily)"
        },
        
        # Sleep Data
        {
            "endpoint": f"/wellness-service/wellness/dailySleepData/{username}",
            "params": {"date": yesterday_str},
            "description": "Sleep Data (Daily)"
        },
        
        # Stress Data - Multiple formats
        {
            "endpoint": f"/wellness-service/wellness/dailyStress/{yesterday_str}",
            "params": None,
            "description": "Stress Data (Daily) - Format 1"
        },
        {
            "endpoint": f"/wellness-service/wellness/dailyStress/{username}",
            "params": {"calendarDate": yesterday_str},
            "description": "Stress Data (Daily) - Format 2"
        },
        
        # Body Battery - Multiple formats
        {
            "endpoint": f"/wellness-service/wellness/bodyBattery/{yesterday_str}",
            "params": None,
            "description": "Body Battery - Format 1"
        },
        {
            "endpoint": f"/wellness-service/wellness/bodyBattery",
            "params": {"startDate": yesterday_str, "endDate": yesterday_str},
            "description": "Body Battery - Format 2"
        },
        {
            "endpoint": f"/wellness-service/wellness/bodyBattery/{username}",
            "params": {"date": yesterday_str},
            "description": "Body Battery - Format 3"
        },
        
        # Heart Rate
        {
            "endpoint": f"/wellness-service/wellness/dailyHeartRate/{username}",
            "params": {"date": yesterday_str},
            "description": "Heart Rate (Daily)"
        },
        
        # Activities
        {
            "endpoint": "/activitylist-service/activities/search/activities",
            "params": {"start": 0, "limit": 10},
            "description": "Recent Activities"
        },
        
        # Hydration
        {
            "endpoint": f"/wellness-service/wellness/dailyHydration/{yesterday_str}",
            "params": None,
            "description": "Hydration (Daily)"
        },
        
        # Respiration
        {
            "endpoint": f"/wellness-service/wellness/dailyRespiration/{yesterday_str}",
            "params": None,
            "description": "Respiration (Daily)"
        },
        
        # Steps
        {
            "endpoint": f"/wellness-service/wellness/dailySteps/{yesterday_str}",
            "params": None,
            "description": "Steps (Daily)"
        },
        
        # Pulse Ox
        {
            "endpoint": f"/wellness-service/wellness/dailySpo2/{username}",
            "params": {"date": yesterday_str},
            "description": "Pulse Ox / SpO2"
        },
    ]
    
    # Résultats
    successful_endpoints = []
    failed_endpoints = []
    
    # Tester chaque endpoint
    for test in endpoints_to_test:
        success, data = test_endpoint(
            test["endpoint"],
            test.get("params"),
            test["description"]
        )
        
        if success:
            successful_endpoints.append(test)
        else:
            failed_endpoints.append(test)
    
    # Résumé
    print(f"\n\n{'='*80}")
    print(f"📊 DIAGNOSTIC SUMMARY")
    print(f"{'='*80}")
    print(f"✅ Successful endpoints: {len(successful_endpoints)}/{len(endpoints_to_test)}")
    print(f"❌ Failed endpoints: {len(failed_endpoints)}/{len(endpoints_to_test)}")
    
    if successful_endpoints:
        print(f"\n✅ Working Endpoints:")
        for ep in successful_endpoints:
            print(f"   - {ep['description']}")
    
    if failed_endpoints:
        print(f"\n❌ Failed Endpoints:")
        for ep in failed_endpoints:
            print(f"   - {ep['description']}")
    
    print(f"\n{'='*80}")
    print(f"💡 Recommendation:")
    print(f"   Update garmin-sync.py to use only the successful endpoints listed above.")
    print(f"{'='*80}\n")

if __name__ == "__main__":
    main()
