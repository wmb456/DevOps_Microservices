#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
dockerpath=ttannhaeuser/udacity-app:0.0.1

# Step 2
kubectl run udacityapp \
	    --generator=run-pod/v1 \
	    --image=$dockerpath \
	    --port=80 --labels app=udacityapp

# Step 3:
kubectl get pods


# Step 4:
kubectl port-forward udacityapp 8000:80


