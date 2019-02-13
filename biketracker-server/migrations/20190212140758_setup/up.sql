CREATE TABLE bike_sessions (
  id uuid PRIMARY KEY NOT NULL,
  finished_at timestamptz NOT NULL,
  session_meters double precision NOT NULL,
  username text
);
