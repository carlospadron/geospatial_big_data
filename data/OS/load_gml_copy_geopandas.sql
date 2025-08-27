USE WAREHOUSE BASIC;
CREATE DATABASE IF NOT EXISTS OS;
USE OS;
CREATE SCHEMA IF NOT EXISTS RAW;
USE SCHEMA RAW;
CREATE STAGE IF NOT EXISTS raw_gml_stage;

LIST @raw_gml_stage;

--copy gml into a table as variant. 
CREATE OR REPLACE TABLE gml_data (data VARIANT);

-- this would work but the GML is too large and can't be copied in directly
COPY INTO gml_data
FROM @raw_gml_stage
FILE_FORMAT = (TYPE = 'XML');

-- Snowflake UDTF to read GML column from table using GeoPandas
-- TODO, smaller data is needed