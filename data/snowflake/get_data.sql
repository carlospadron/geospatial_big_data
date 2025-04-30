USE DATABASE GIS;
USE SCHEMA OSM;
USE WAREHOUSE BASIC;

CREATE OR REPLACE STAGE osm_s3
  URL='s3://giscarlos/osm/'
  CREDENTIALS=(AWS_KEY_ID=$AWS_KEY_ID AWS_SECRET_KEY=$AWS_SECRET_KEY)
  ENCRYPTION=(TYPE='AWS_SSE_KMS' KMS_KEY_ID = 'aws/key');

CREATE OR REPLACE EXTERNAL TABLE planet (
  id BIGINT AS (value:id::BIGINT),
  type STRING AS (value:type::STRING),
  tags VARIANT AS (value:tags),
  lat DOUBLE PRECISION AS (value:lat::DOUBLE),
  lon DOUBLE PRECISION AS (value:lon::DOUBLE),
  nds ARRAY AS (value:nds::ARRAY),
  members ARRAY AS (value:members::ARRAY),
  changeset BIGINT AS (value:changeset::BIGINT),
  timestamp TIMESTAMP AS (value:timestamp::TIMESTAMP),
  uid BIGINT AS (value:uid::BIGINT),
  user STRING AS (value:user::STRING),
  version BIGINT AS (value:version::BIGINT),
  visible BOOLEAN AS (value:visible::BOOLEAN)
)
LOCATION = @osm_s3
FILE_FORMAT = (TYPE = ORC);

select * from planet
limit 10;