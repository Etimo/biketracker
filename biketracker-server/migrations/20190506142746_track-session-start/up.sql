ALTER TABLE bike_sessions ADD COLUMN started_at timestamptz;
UPDATE bike_sessions SET started_at=finished_at;
ALTER TABLE bike_sessions ALTER COLUMN started_at SET NOT NULL;
ALTER TABLE bike_sessions ALTER COLUMN finished_at SET DEFAULT now();
ALTER TABLE bike_sessions ALTER COLUMN started_at SET DEFAULT now();
