#!/bin/bash

# Strava Sync Cron Wrapper
# This script is called by cron to sync Strava activities

PROJECT_DIR="/home/tahar/project/Maven/migraine-tracker"
LOG_FILE="$PROJECT_DIR/logs/strava.log"

# Create logs directory if it doesn't exist
mkdir -p "$PROJECT_DIR/logs"

# Log start
echo "========================================" >> "$LOG_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting Strava sync" >> "$LOG_FILE"

# Activate virtual environment and run sync
cd "$PROJECT_DIR"
source .venv/bin/activate
python3 scripts/strava-sync.py >> "$LOG_FILE" 2>&1

# Log completion
echo "$(date '+%Y-%m-%d %H:%M:%S') - Strava sync completed" >> "$LOG_FILE"
echo "========================================" >> "$LOG_FILE"
