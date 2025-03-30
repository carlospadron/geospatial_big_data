#%%
from snowflake.snowpark import Session

#%%
session = Session.builder.config("connection_name", "zpnlrxp-gn04931").create()
# %%
# cannot read from url, onlu from stage
session.read.xml('https://planet.openstreetmap.org/planet/planet-latest.osm.bz2')

#%%
session.close()
# %%
