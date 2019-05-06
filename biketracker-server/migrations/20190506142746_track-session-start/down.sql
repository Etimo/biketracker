ALTER TABLE bike_sessions DROP COLUMN started_at;
ALTER TABLE bike_sessions ALTER COLUMN finished_at DROP DEFAULT;
