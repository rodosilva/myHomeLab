#!/bin/bash

source variables.env

docker run --rm -it \
           -w /app \
           -v ~/.ssh/id_ed25519:/root/.ssh/id_ed25519 \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -e CONTAINER_NAME \
           -e CONTAINER_TAG \
           -e RASPBERRY_IP \
           ${CONTAINER_NAME}:${CONTAINER_TAG}