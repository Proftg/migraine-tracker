#!/bin/bash
# Garmin Sync Cron Wrapper
# This script is called by cron to sync Garmin data daily

# Set working directory
cd /home/tahar/project/Maven/migraine-tracker

# Log start time
echo "=== Garmin Sync Started at $(date) ===" >> logs/garmin.log

# Activate virtual environment if it exists
if [ -d ".venv" ]; then
    source .venv/bin/activate
fi

# Run the sync script
python3 scripts/garmin-sync.py >> logs/garmin.log 2>&1

# Log completion
echo "=== Garmin Sync Completed at $(date) ===" >> logs/garmin.log
echo "" >> logs/garmin.log

exit 0
