# 🏃 Garmin Connect Data Sync

Automated script to download your daily health data from Garmin Connect.

## 🚀 Quick Start

### 1. Installation

```bash
cd migraine-tracker
bash scripts/setup-garmin.sh
```

This will install the required Python dependencies (`garth` and `python-dotenv`).

### 2. First Run

```bash
python3 scripts/garmin-sync.py
```

You'll be prompted to enter your Garmin Connect credentials. They will be saved securely in `.env.garmin`.

### 3. Daily Sync

Run manually or setup automation (see below).

---

## 📊 Data Collected

For each day, the script downloads:

- **Daily Summary**: Steps, distance, calories, activity minutes
- **Sleep**: Total sleep time, deep/light/REM sleep, sleep score
- **Stress**: Average and max stress levels throughout the day
- **Heart Rate**: Resting, min, and max heart rate
- **Activities**: All logged workouts with details

Data is saved as JSON in `garmin-data/YYYY-MM-DD.json`.

---

## 🤖 Automation Options

### Option A: Automatic Setup (Recommended)

We have created a script to automatically set up the daily sync at 7:00 AM.

```bash
bash scripts/install-garmin-cron.sh
```

This will:
1. Create a wrapper script (`scripts/garmin-cron.sh`)
2. Add a cron job to run it daily at 7:00 AM
3. Create a log file at `logs/garmin.log`

To check the logs:
```bash
tail -f logs/garmin.log
```

### Option B: Windows Task Scheduler

### Option C: Manual Sync

Just run the script whenever you want:

```bash
python3 scripts/garmin-sync.py
```

Or sync a specific date:

```bash
python3 scripts/garmin-sync.py 2025-11-25
```

---

## 🔒 Security

**Important**: Your Garmin credentials are stored in `.env.garmin`:
- ✅ This file is in `.gitignore` (won't be committed)
- ✅ Authentication tokens are cached in `~/.garmin/`
- ⚠️ Keep these files secure on your machine

**Never share or commit** `.env.garmin`!

---

## 🔄 Integration with MigraineChecker

The Next.js app can read these JSON files to:

1. **Improve AI Predictions**:
   - Sleep quality correlation with migraines
   - Stress levels as triggers
   - Activity impact on headaches

2. **Enhanced Analytics**:
   - Heart rate variability patterns
   - Recovery metrics
   - Sleep-migraine correlation graphs

3. **Automatic Journal Entries**:
   - Auto-log poor sleep
   - Track exercise sessions
   - Monitor stress spikes

*Next step: Create an API endpoint to parse and integrate this data into the prediction model.*

---

## 🛠️ Troubleshooting

### "Login failed"
- Check your credentials in `.env.garmin`
- Verify you can log in at connect.garmin.com
- Try deleting `~/.garmin/tokens.json` and logging in again

### "Missing dependencies"
- Run `bash scripts/setup-garmin.sh` again
- Or manually: `python3 -m pip install garth python-dotenv`

### No data for a specific date
- Garmin data is usually complete after midnight
- Try syncing the previous day instead
- Some metrics may not be available if you didn't wear the device

---

## ⚠️ Legal Notice

This script uses **unofficial Garmin Connect APIs** via the `garth` library:
- Not officially supported by Garmin
- Could break if Garmin changes their API
- Use at your own risk
- For personal use only

**Alternative**: Export data manually from Garmin Connect and place JSON files in `garmin-data/`.
