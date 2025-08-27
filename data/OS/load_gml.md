To load a GML file into snowflake as a geospatial table, there are a few alternatives:
- Load to stage, copy into a table as variant, use python UDTF with geopandas. It works only if the GML is small enough.
- Load to stage, use apache sedona to read. It needs sedona installed
- Use Duckdb