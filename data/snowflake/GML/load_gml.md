To load a GML file into snowflake as a geospatial table, there are a few alternatives:
- Use ogr2ogr to convert GML to GeoJson, load to stage, infer_schema, copy into table.
- Use geopandas to load into snowflake concurrently

# Good ideas that won't work or are laborious
- Load to stage, copy into a table as variant, use python UDTF with geopandas. Parse the XML, however it is laborious as infer_schema does not work for XML.
- Use Duckdb to read and then save in snowflake. However, as of today there is no extension to connect Duckdb with Snowflake.
- Use pyspark to read in memory and write into Snowflake, however, Sedona cannot read GML.
- Use ogr2ogr to write into snowflake, however ogr2ogr does not connect to Snowflake.


