# Download the OSM file
aws s3 cp --no-sign-request s3://osm-planet-eu-central-1/planet/pbf/2025/planet-250331.osm.pbf .

# Extract only buildings and save them to a CSV file
ogr2ogr -f "CSV" buildings.csv planet-250331.osm.pbf multipolygons -where "building IS NOT NULL"