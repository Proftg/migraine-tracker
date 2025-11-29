-- Add missing columns for Screen Time and Calories features
-- 1. Add columns for Screen Time tracking
ALTER TABLE journal_entries
ADD COLUMN IF NOT EXISTS duration numeric,
    ADD COLUMN IF NOT EXISTS "breakFrequency" integer,
    ADD COLUMN IF NOT EXISTS "blueLightFilter" boolean;
-- 2. Add columns for Calorie tracking
ALTER TABLE journal_entries
ADD COLUMN IF NOT EXISTS "totalCalories" integer,
    ADD COLUMN IF NOT EXISTS "mealBreakdown" jsonb;
-- 3. Comment on columns for clarity
COMMENT ON COLUMN journal_entries.duration IS 'Duration in hours (for screen time) or minutes (for sports)';
COMMENT ON COLUMN journal_entries."breakFrequency" IS 'Frequency of breaks in minutes';
COMMENT ON COLUMN journal_entries."blueLightFilter" IS 'Whether blue light filter was used';
COMMENT ON COLUMN journal_entries."totalCalories" IS 'Total daily calorie intake';
COMMENT ON COLUMN journal_entries."mealBreakdown" IS 'JSON object with breakfast, lunch, dinner, snacks calories';