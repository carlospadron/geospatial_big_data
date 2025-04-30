# OSM to Postgresql

Please read data  [overview](../README.md)
There are a few options to read the PBF to postgresql OGR2OGR, Osmium etc.
Please note that uploading OSM to Postgresql is a very slow process that takes hours or days depending the size of the dataset.

## Folder content
This folder contains a bash script to download and uploade OSM data and a Dockerfile to containerise the script. You can use the container locally or in a cloud service.

## Process 
To download OSM data and upload to Postgresql. You could either use EC2, ECS or your own machine if you have enough RAM, disk storage and network bandwith.

### prepare image
build image ```sudo docker build -t geospatial_big_data .```
push to any registry if needed e.g. ECR

### local machine
run container ```sudo docker run -d --env-file .env geospatial_big_data```

### EC2:
set policies in S3 to trust EC2 (see iam_s3_policies.md)
launch instance using new policy
get image from registry
run container ```sudo docker run -d --env-file .env geospatial_big_data```