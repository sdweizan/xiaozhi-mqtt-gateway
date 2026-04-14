#!/bin/bash
git pull
IMAGE_NAME=registry-vpc.cn-hangzhou.aliyuncs.com/caihong5g/xiaozhi-gateway
docker build -f Dockerfile -t $IMAGE_NAME:latest .
docker push $IMAGE_NAME:latest