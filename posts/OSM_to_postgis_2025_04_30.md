If you're interested in using OpenStreetMap (OSM) data with PostgreSQL, you can download a global snapshot from OpenStreetMap or a regional extract from Geofabrik. Once downloaded, you can use ogr2ogr to upload the data to a PostgreSQL database.

While PostgreSQL with PostGIS is a powerful combination, OSM data can be very large, and the upload process may take hours or even days.

Below is an example of a bash script that downloads a planet PBF file and uploads only the building data to PostgreSQL.

In future posts, I'll explore other tools and techniques to make this process faster and more efficient. 

#OSM #PostGIS #GIS #OGR2OGR

comment:
More info and code can be found here: https://github.com/carlospadron/geospatial_big_data/tree/main/data