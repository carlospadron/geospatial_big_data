# OSM data ingestion
OSM files come in two formats, XML and PBF. PBF is binary and therefore smaller (80Gb vs 160GB for the full dataset). The files can be downloaded from the OSM Plannet website https://planet.openstreetmap.org/ or straight from OSM S3 s3://osm-planet-eu-central-1/planet which is faster.
OSM data can be ingested to different platforms like Postgresql, Snowflake, Databrics and S3 tables.
Please refer to the right documentation for each platform.
- [OSM to Postgresql](./postgresql/README.md)

