-- Add columns for Strava integration
ALTER TABLE journal_entries
ADD COLUMN IF NOT EXISTS "stravaId" text,
    ADD COLUMN IF NOT EXISTS "averageHeartRate" numeric,
    ADD COLUMN IF NOT EXISTS "maxHeartRate" numeric,
    ADD COLUMN IF NOT EXISTS "elevationGain" numeric,
    ADD COLUMN IF NOT EXISTS "sufferScore" numeric,
    ADD COLUMN IF NOT EXISTS "distance" numeric,
    ADD COLUMN IF NOT EXISTS "activityType" text,
    ADD COLUMN IF NOT EXISTS "caloriesBurned" numeric;
-- Add unique constraint on stravaId to prevent duplicates
-- But only if it doesn't exist (Postgres doesn't have IF NOT EXISTS for constraints easily, so we use a DO block)
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint
    WHERE conname = 'journal_entries_stravaId_key'
) THEN
ALTER TABLE journal_entries
ADD CONSTRAINT journal_entries_stravaId_key UNIQUE ("stravaId");
END IF;
END $$;
COMMENT ON COLUMN journal_entries."stravaId" IS 'Unique ID from Strava';
COMMENT ON COLUMN journal_entries."sufferScore" IS 'Strava Relative Effort score';