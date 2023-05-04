#! /bin/bash

docker build -t sunkezheng/hexo .
docker push sunkezheng/hexo:latest
docker rmi $(docker images -f "dangling=true" -q)