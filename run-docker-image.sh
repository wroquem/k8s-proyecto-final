#!/usr/bin/env bash

IMAGE_NAME="mi-app"
IMAGE_TAG="latest"

if docker image inspect "${IMAGE_NAME}:${IMAGE_TAG}" >/dev/null 2>&1; then
    echo "Executing Docker image ${IMAGE_NAME}:${IMAGE_TAG}."
	docker run ${IMAGE_NAME}:${IMAGE_TAG}
	docker rm $(docker stop $(docker ps -a | grep "${IMAGE_NAME}:${IMAGE_TAG}" | awk '{print $1}')) > /dev/null 2>&1
else
    echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}"
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
	#clear
	echo "Executing Docker image ${IMAGE_NAME}:${IMAGE_TAG}."
	docker run ${IMAGE_NAME}:${IMAGE_TAG}
	docker rm $(docker stop $(docker ps -a | grep "${IMAGE_NAME}:${IMAGE_TAG}" | awk '{print $1}')) > /dev/null 2>&1
fi