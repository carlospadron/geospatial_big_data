USE DATABASE GIS;
USE SCHEMA OSM;
USE WAREHOUSE BASIC;

CREATE OR REPLACE STAGE osm_s3
  URL='s3://giscarlos/osm/'
  CREDENTIALS=(AWS_KEY_ID=$AWS_KEY_ID AWS_SECRET_KEY=$AWS_SECRET_KEY)
  ENCRYPTION=(TYPE='AWS_SSE_KMS' KMS_KEY_ID = 'aws/key');

CREATE TABLE IF NOT EXISTS planet (
  id BIGINT,
  type STRING,
  tags OBJECT,
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
COPY INTO planet
FROM @osm_s3/planet-latest.orc
FILE_FORMAT = (TYPE = ORC)
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;