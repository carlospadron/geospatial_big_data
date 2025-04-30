USE WAREHOUSE BIG_JOBS; --xlarge
CREATE TABLE IF NOT EXISTS planet_internal (
  id BIGINT,
  type STRING,
  tags VARIANT,
  lat DOUBLE PRECISION,
  lon DOUBLE PRECISION,
  nds ARRAY,
  members ARRAY,
  changeset BIGINT,
  timestamp TIMESTAMP,
  uid BIGINT,
  user STRING,
  version BIGINT,
  visible BOOLEAN
);

-- Copy data from the internal stage into the table
COPY INTO planet_internal
FROM @osm_s3/planet-latest.orc
FILE_FORMAT = (TYPE = ORC)
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

--445 008 000 1h 15 min