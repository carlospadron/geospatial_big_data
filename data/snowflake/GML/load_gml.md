To load a GML file into snowflake as a geospatial table, there are a few alternatives:
- Load to stage, copy into a table as variant, use python UDTF with geopandas. It works only if the GML is small enough.
- Use Duckdb to read and then save in snowflake.

Sedona would be great but snowspark can't read direcly from stage.