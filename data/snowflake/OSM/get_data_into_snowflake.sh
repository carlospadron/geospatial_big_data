#!/bin/bash

# Initial Timestamp
current_time=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script started at: $current_time"

# Set up Snowflake stage
snowsql -a $SNOWFLAKE_ACCOUNT \
    -u $SNOWFLAKE_USER  \
    -D AWS_KEY_ID=$AWS_KEY_ID \
    -D AWS_SECRET_KEY=$AWS_SECRET_KEY \
    -D PRIVATE_S3_BUCKET=$private_s3_bucket \
    -o variable_substitution=true \
    -f create_stage.sql

# option 1: Create the internal table (preferred)
snowsql -a $SNOWFLAKE_ACCOUNT \
    -u $SNOWFLAKE_USER  \
    -f create_internal_table.sql    

# option 2: create external table
# snowsql -a $SNOWFLAKE_ACCOUNT \
#     -u $SNOWFLAKE_USER  \
#     -f create_external_table.sql        

# Final Timestamp
current_time2=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script finished at: $current_time2"
echo "Script duration: $(date -u -d @$(( $(date -d "$current_time2" +%s) - $(date -d "$current_time" +%s) )) +%H:%M:%S)"