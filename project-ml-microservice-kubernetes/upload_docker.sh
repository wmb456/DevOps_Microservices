#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

. config.sh

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
DOCKERPATH=${HUB_USER}/${IMAGE_NAME}

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $DOCKERPATH"
docker login --username=${HUB_USER}
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERPATH}:${IMAGE_TAG}

# Step 3:
# Push image to a docker repository
docker push ${DOCKERPATH}



