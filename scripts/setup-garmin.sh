#!/bin/bash
# Setup script for Garmin Connect synchronization

echo "======================================"
echo "🏃 Garmin Connect Sync - Setup"
echo "======================================"
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed!"
    echo "   Please install Python 3.8+ first"
    exit 1
fi

echo "✅ Python 3 found: $(python3 --version)"
echo ""

# Install Python dependencies (Force system install)
echo "📦 Installing Python dependencies..."
python3 -m pip install garth python-dotenv supabase --break-system-packages

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "======================================"
echo "✅ Setup Complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "1. Run the sync script: python3 scripts/garmin-sync.py"
echo "2. Enter your Garmin credentials when prompted"
echo "3. (Optional) Setup daily cron job (see GARMIN_SYNC.md)"
echo ""
