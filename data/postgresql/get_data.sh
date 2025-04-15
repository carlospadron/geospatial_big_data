#!/bin/bash

# Initial Timestamp
current_time=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script started at: $current_time"

# Download the OSM file
aws s3 cp --no-sign-request s3://osm-planet-eu-central-1/planet/pbf/2025/planet-250331.osm.pbf .

# Upload the OSM file to postgres
ogr2ogr -f "PostgreSQL" PG:"host=$HOST dbname=$DB user=$USER password=$PW schema=osm" \
    planet-250331.osm.pbf multipolygons -where "building IS NOT NULL" \
    -nln buildings -overwrite -skipfailures

# Final Timestamp
current_time2=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script finished at: $current_time2"
echo "Script duration: $(date -u -d @$(( $(date -d "$current_time2" +%s) - $(date -d "$current_time" +%s) )) +%H:%M:%S)"