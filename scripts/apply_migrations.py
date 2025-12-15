#!/usr/bin/env python3
"""
Script pour appliquer les migrations SQL à Supabase
"""
import os
import glob
from dotenv import load_dotenv
from supabase import create_client

# Load environment variables
load_dotenv('.env.local')

SUPABASE_URL = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')

def apply_migrations():
    print("🚀 Applying Supabase migrations...")
    
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("❌ Error: Supabase credentials missing")
        print("Please set NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env.local")
        return
    
    supabase = create_client(SUPABASE_URL, SUPABASE_KEY)
    
    # Get all migration files in order
    migration_files = sorted(glob.glob("migrations/*.sql"))
    
    if not migration_files:
        print("⚠️  No migration files found in migrations/")
        return
    
    print(f"📁 Found {len(migration_files)} migration file(s)")
    
    for migration_file in migration_files:
        print(f"\n📄 Applying: {migration_file}")
        
        try:
            with open(migration_file, 'r', encoding='utf-8') as f:
                sql = f.read()
            
            # Execute SQL via Supabase RPC
            # Note: This requires having a function in Supabase to execute raw SQL
            # Alternative: Use psycopg2 to connect directly
            
            print(f"   SQL content length: {len(sql)} characters")
            print(f"   ⚠️  Manual execution required")
            print(f"   Please run this SQL in Supabase SQL Editor:")
            print(f"   {SUPABASE_URL.replace('https://', 'https://supabase.com/dashboard/project/')}/editor")
            
        except Exception as e:
            print(f"   ❌ Error reading {migration_file}: {e}")
            continue
    
    print(f"\n{'='*80}")
    print("⚠️  IMPORTANT: Migrations must be applied manually")
    print(f"{'='*80}")
    print("\n📋 Steps to apply migrations:")
    print("1. Go to Supabase Dashboard: {}/editor".format(SUPABASE_URL.replace('https://', 'https://supabase.com/dashboard/project/')))
    print("2. Open SQL Editor")
    print("3. Copy and paste each migration file content")
    print("4. Execute the SQL")
    print("\nOr use the Supabase CLI:")
    print("   supabase db push --linked")
    print(f"{'='*80}\n")

if __name__ == "__main__":
    apply_migrations()
