
print("Start test...", flush=True)
try:
    import garth
    print("✅ garth imported", flush=True)
except ImportError as e:
    print(f"❌ garth failed: {e}", flush=True)

try:
    import dotenv
    print("✅ dotenv imported", flush=True)
except ImportError as e:
    print(f"❌ dotenv failed: {e}", flush=True)

try:
    import supabase
    print("✅ supabase imported", flush=True)
except ImportError as e:
    print(f"❌ supabase failed: {e}", flush=True)

print("End test.", flush=True)
