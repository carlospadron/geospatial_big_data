# OSM to S3

OSM files come in two formats, XML and PBF. PBF is binary and therefore smaller (80Gb vs 160GB for the full dataset). The files can be downloaded from a website https://planet.openstreetmap.org/ or straight from OSM S3 s3://osm-planet-eu-central-1/planet which is faster.
In order to be used by databases and data warehouses, we can transform the PBF file into CSV which is universally adopted, store it in S3 and read it into the target platfform.
The data can be filtered out using the tags https://wiki.openstreetmap.org/wiki/Tags . There are a few options to transform the PBF to another format OGR2OGR, Pyrosm, Osmium etc.

## Process 
To download OSM and store in S3 as CSV. You could either use EC2, ECS or your own machine if you have enough RAM, disk storage and network bandwith.

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