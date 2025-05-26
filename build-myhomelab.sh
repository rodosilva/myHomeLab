#!/bin/bash

source variables.env

docker build --ssh default=$HOME/.ssh/id_ed25519 \
             --build-arg CONTAINER_NAME=${CONTAINER_NAME} \
             --build-arg CONTAINER_TAG=${CONTAINER_TAG} \
             --build-arg ENTRYPOINT=${ENTRYPOINT} \
             --build-arg RASPBERRY_IP=${RASPBERRY_IP} \
             -t ${CONTAINER_NAME}:${CONTAINER_TAG} \
             .

