To upload OpenStreetMap data to Snowflake, you can use the ORC file available from the OpenStreetMap AWS Public Dataset. Compared to other formats (XML and PBF), ORC offers the best compression. The planet file is just 5GB.

By setting up an S3 bucket with the right permissions as a Snowflake stage, you can copy the entire planet file (about 445 million rows) into a Snowflake table in about an hour using the `COPY INTO` command.

In future posts, I'll explore Snowflake's spatial functions to query and transform this data.

#OpenStreetMap #OSM #Snowflake #Geospatial

More info and code can be found here: https://github.com/carlospadron/geospatial_big_data/tree/main/data