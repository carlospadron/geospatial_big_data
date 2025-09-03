# Read GML
#%%
import duckdb

#install spatial extension
duckdb.sql("""
INSTALL spatial;
LOAD spatial;
""")

#read gml files
duckdb.sql("""
CREATE TABLE gml_data AS
SELECT *
FROM ST_Read('/home/cpadron/gitlab2/geospatial_big_data/data/OS/INSPIRE_AdministrativeUnit.gml');
""")

duckdb.sql("SELECT * FROM gml_data LIMIT 5").df()

# Connect to snowflake
"""
As of today, there are no core extensions to connect to snowflake from duckdb. There is an extension
called nanodbc but it is not available in the latest versions of duckdb.
https://duckdb.org/community_extensions/extensions/nanodbc.html
"""