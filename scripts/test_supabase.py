import sys
sys.path.insert(0, '.libs')

from supabase import create_client

url = "https://havwpuuxnskrluulpaqk.supabase.co"
key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhdndwdXV4bnNrcmx1dWxwYXFrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQwODE5NzAsImV4cCI6MjA3OTY1Nzk3MH0.mdSbCo2GhWubM7EkkbnOXIilJeH7ceGN-gh-RCFzgWE"

supabase = create_client(url, key)

try:
    result = supabase.table("garmin_metrics").select("*").limit(5).execute()
    print("✅ Table exists!")
    print(f"Rows found: {len(result.data)}")
    if result.data:
        print("Sample data:", result.data[0])
except Exception as e:
    print(f"❌ Error: {e}")
    print("The table probably doesn't exist yet. Please run the SQL command in Supabase dashboard.")
