#!/usr/bin/env python3
"""
Clean and re-sync Strava data
This script removes old Strava entries and re-imports them with improved formatting
"""

import os
from dotenv import load_dotenv
from supabase import create_client

# Load environment variables
load_dotenv('.env.local')

# Initialize Supabase client
supabase_url = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
supabase_key = os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')
supabase = create_client(supabase_url, supabase_key)

def clean_strava_data():
    """Remove all existing Strava entries"""
    print("🧹 Cleaning old Strava data...")
    
    try:
        # Delete all entries with IDs starting with 'strava_'
        result = supabase.table('journal_entries').delete().ilike('id', 'strava_%').execute()
        print(f"✅ Deleted {len(result.data) if result.data else 0} old Strava entries")
        return True
    except Exception as e:
        print(f"❌ Error cleaning data: {e}")
        return False

def clean_incomplete_entries():
    """Remove entries without essential data to improve prediction quality"""
    print("\n🧹 Cleaning incomplete entries...")
    
    try:
        # Get all entries
        all_entries = supabase.table('journal_entries').select('*').execute()
        
        deleted_count = 0
        for entry in all_entries.data:
            should_delete = False
            
            # Check migraine entries
            if entry['type'] == 'migraine':
                if not entry.get('intensity') or entry.get('intensity') == 0:
                    should_delete = True
                    print(f"  Removing migraine entry without intensity: {entry['id']}")
            
            # Check activity entries
            elif entry['type'] == 'activity':
                if not entry.get('duration') or entry.get('duration') == 0:
                    should_delete = True
                    print(f"  Removing activity entry without duration: {entry['id']}")
            
            # Check screen time entries
            elif entry['type'] == 'screentime':
                if not entry.get('duration') or entry.get('duration') == 0:
                    should_delete = True
                    print(f"  Removing screen time entry without duration: {entry['id']}")
            
            # Check calorie entries
            elif entry['type'] == 'calories':
                if not entry.get('totalCalories') or entry.get('totalCalories') == 0:
                    should_delete = True
                    print(f"  Removing calorie entry without data: {entry['id']}")
            
            if should_delete:
                supabase.table('journal_entries').delete().eq('id', entry['id']).execute()
                deleted_count += 1
        
        print(f"✅ Removed {deleted_count} incomplete entries")
        return True
    except Exception as e:
        print(f"❌ Error cleaning incomplete entries: {e}")
        return False

if __name__ == "__main__":
    print("=" * 60)
    print("🔧 Strava Data Cleanup Tool")
    print("=" * 60)
    
    # Clean old Strava data
    if clean_strava_data():
        print("\n✅ Strava data cleaned successfully!")
    
    # Clean incomplete entries
    if clean_incomplete_entries():
        print("\n✅ Incomplete entries cleaned successfully!")
    
    print("\n" + "=" * 60)
    print("🎯 Now run: python3 scripts/strava-sync.py")
    print("=" * 60)
