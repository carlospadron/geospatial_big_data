#!/bin/bash

# Download the OSM file
aws s3 cp --no-sign-request s3://osm-planet-eu-central-1/planet/pbf/2025/planet-250331.osm.pbf .

# Upload the OSM file to postgres
ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DB user=$USER password=$PW" \
    planet-250331.osm.pbf multipolygons -where "building IS NOT NULL" \
    -nln buildings -overwrite