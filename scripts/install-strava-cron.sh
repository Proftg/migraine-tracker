#!/bin/bash

# Strava Cron Job Installer
# This script sets up automatic daily Strava synchronization

PROJECT_DIR="/home/tahar/project/Maven/migraine-tracker"

echo "🤖 Installing Strava Sync Cron Job..."
echo ""

# Make the cron wrapper executable
chmod +x "$PROJECT_DIR/scripts/strava-cron.sh"

# Check if cron job already exists
if crontab -l 2>/dev/null | grep -q "strava-cron.sh"; then
    echo "⚠️  Cron job already exists. Removing old entry..."
    crontab -l 2>/dev/null | grep -v "strava-cron.sh" | grep -v "Strava" | crontab -
fi

# Add new cron job
echo "📝 Adding cron job: Daily sync at 11:00 AM..."
(crontab -l 2>/dev/null; echo "# Strava Activity Sync - Daily at 11 AM") | crontab -
(crontab -l 2>/dev/null; echo "0 11 * * * $PROJECT_DIR/scripts/strava-cron.sh") | crontab -

echo ""
echo "✅ Cron job installed successfully!"
echo ""
echo "📋 Current crontab:"
crontab -l | grep -A1 "Strava"
echo ""
echo "📊 The script will run every day at 11:00 AM"
echo "📁 Logs will be saved to: $PROJECT_DIR/logs/strava.log"
echo ""
echo "🧪 To test the sync manually, run:"
echo "   bash $PROJECT_DIR/scripts/strava-cron.sh"
echo ""
echo "🗑️  To remove the cron job, run:"
echo "   crontab -e  (then delete the Strava lines)"
