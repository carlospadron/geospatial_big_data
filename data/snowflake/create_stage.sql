CREATE DATABASE IF NOT EXISTS GIS;
CREATE SCHEMA IF NOT EXISTS GIS.OSM;
CREATE OR REPLACE STAGE GIS.OSM.OSM
  URL='s3://&PRIVATE_S3_BUCKET'
  CREDENTIALS=(AWS_KEY_ID='&AWS_KEY_ID', AWS_SECRET_KEY='&AWS_SECRET_KEY')
  ENCRYPTION=(TYPE='AWS_SSE_KMS' KMS_KEY_ID = 'aws/key');