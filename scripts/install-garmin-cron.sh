#!/bin/bash
# Script to install Garmin sync cron job
# Run this script to set up automatic daily synchronization

echo "🤖 Installing Garmin Sync Cron Job..."
echo ""

# Get the absolute path to the project
PROJECT_DIR="/home/tahar/project/Maven/migraine-tracker"

# Check if cron job already exists
if crontab -l 2>/dev/null | grep -q "garmin-cron.sh"; then
    echo "⚠️  Cron job already exists. Removing old entry..."
    crontab -l 2>/dev/null | grep -v "garmin-cron.sh" | crontab -
fi

# Add new cron job
echo "📝 Adding cron job: Daily sync at 11:00 AM..."
(crontab -l 2>/dev/null; echo "# Garmin Connect Data Sync - Daily at 11 AM") | crontab -
(crontab -l 2>/dev/null; echo "0 11 * * * $PROJECT_DIR/scripts/garmin-cron.sh") | crontab -

echo ""
echo "✅ Cron job installed successfully!"
echo ""
echo "📋 Current crontab:"
crontab -l | grep -A1 "Garmin"
echo ""
echo "📊 The script will run every day at 11:00 AM"
echo "📁 Logs will be saved to: $PROJECT_DIR/logs/garmin.log"
echo ""
echo "🧪 To test the sync manually, run:"
echo "   bash $PROJECT_DIR/scripts/garmin-cron.sh"
echo ""
echo "📖 To view logs:"
echo "   tail -f $PROJECT_DIR/logs/garmin.log"
echo ""
echo "🗑️  To remove the cron job:"
echo "   crontab -e  (then delete the Garmin lines)"
echo ""
