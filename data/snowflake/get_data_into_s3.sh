#!/bin/bash

# Initial Timestamp
current_time=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script started at: $current_time"

# Download the OSM file to own bucket
aws s3 cp --no-sign-request s3://osm-pds/planet/planet-latest.orc . 
aws s3 cp planet-latest.orc s3://$private_s3_bucket

# Final Timestamp
current_time2=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script finished at: $current_time2"
echo "Script duration: $(date -u -d @$(( $(date -d "$current_time2" +%s) - $(date -d "$current_time" +%s) )) +%H:%M:%S)"