# OSM to Snowflake

Please read data  [overview](../README.md)
To get OSM data into Snowflake, the simplest way is to copy the ORC data from the public S3 to a private S3 and set the private S3 bucket it so it can be used by a Snowflake stage. Once the stage is created, it can be copied into a table.

## Folder content
This folder contains:
- a bash script to copy the the data from the public S3 to a private S3. This can be run locally or in any docker container. See dockerfile.
- 3 sql scripts to create a stage, create and populate internal table and create and populate external table. The external table is optional. These scripts can be run on Snowsight or Snowsql. The bash script provided is mostly helpful if you plan to run it in a container.

## AWS CLI
You can install AWS cli by running:
```sh install_aws_cli.sh```
You'll need to set it as well.

## Snowsql
Snowsql can be obtained here: https://www.snowflake.com/en/developers/downloads/snowsql/

## Process 
```
source .env
sh get_data_into_s3.sh 
sh get_data_into_snowflake.sh
```

This scripts can be containerised if needed. Also, the sql scripts can be run directly in snowsight or using Snowflake's VS code extension.