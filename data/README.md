# OSM data ingestion
OSM files come in three formats, XML, PBF and ORC. PBF and ORC are smaller. The files can be downloaded from a website https://planet.openstreetmap.org/ , https://download.geofabrik.de/ which has files per region or straight from OSM S3 s3://osm-pds which is faster.
In order to be used by databases and data warehouses, we can use the ORC files.
The data can be filtered out using the tags https://wiki.openstreetmap.org/wiki/Tags .
OSM data can be ingested to different platforms like Postgresql, Snowflake, Databrics and S3 tables.

Please refer to the right documentation for each platform.
- [OSM to Postgresql](./postgresql/README.md)
- [OSM to snowflake] (./snowflake/README.md)

