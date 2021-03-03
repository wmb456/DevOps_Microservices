#!/usr/bin/env bash

IMAGE_NAME=udacity-app
IMAGE_TAG=0.0.1
HOST_PORT=8000


# Step 1:
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

# Step 2: 
docker images ${IMAGE_NAME}

# Step 3: 
echo
echo "expose service on: http://$(nslookup -type=A $(hostname)  | grep Name | awk '{ print $2}'):${HOST_PORT}"
echo 
docker run --rm -p ${HOST_PORT}:80 ${IMAGE_NAME}:${IMAGE_TAG}
