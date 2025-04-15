-- Use the GIS database
USE DATABASE GIS;

-- Switch to the newly created schema
USE SCHEMA OSM;

-- Create storage integration for S3
CREATE OR REPLACE STORAGE INTEGRATION public_s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:s3:::osm-pds'
STORAGE_ALLOWED_LOCATIONS = ('s3://osm-planet-eu-central-1/');

-- Create an external stage linked to an OpenStreetMap (OSM) S3 bucket
CREATE OR REPLACE STAGE osm_s3_stage
URL = 's3://osm-planet-eu-central-1/planet/osm/2025/planet-250407.osm.bz2'
STORAGE_INTEGRATION = public_s3_integration;

-- Create a table to store the XML data
CREATE OR REPLACE TABLE osm_xml_data (
    id STRING,
    xml_content STRING
);

-- Copy data from the external stage into the table
COPY INTO osm_xml_data
FROM @osm_s3_stage
FILE_FORMAT = (TYPE = 'XML' COMPRESSION = 'BZ2')
ON_ERROR = 'CONTINUE';
