#! /bin/bash

docker build -t sunkezheng/sentinel-dashboard .
docker push sunkezheng/sentinel-dashboard:latest
docker rmi $(docker images -f "dangling=true" -q)

