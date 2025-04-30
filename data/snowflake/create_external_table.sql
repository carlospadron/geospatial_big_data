CREATE OR REPLACE EXTERNAL TABLE planet_external (
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