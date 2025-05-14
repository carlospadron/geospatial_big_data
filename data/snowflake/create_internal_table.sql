CREATE OR REPLACE WAREHOUSE OSM
  WAREHOUSE_SIZE = 'XLARGE'
  AUTO_SUSPEND = 30
  AUTO_RESUME = TRUE;

CREATE TABLE IF NOT EXISTS GIS.OSM.planet_internal (
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
FROM @GIS.OSM.OSM/planet-latest.orc
FILE_FORMAT = (TYPE = ORC)
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

--445 008 000 rows, 1h 15 min