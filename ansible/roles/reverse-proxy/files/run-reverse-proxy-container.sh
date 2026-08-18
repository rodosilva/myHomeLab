#!/bin/bash

# Bash script encargado de correr la imagen del contenedor de reverse-proxy

source $1

docker network create -d bridge homelab

docker run --rm -it -d \
          --name ${CONTAINER_REVERSEPROXY_NAME} \
          --network homelab \
           -p 80:80 \
           -p 443:443 \
           -e CONTAINER_REVERSEPROXY_NAME \
           -e CONTAINER_REVERSEPROXY_TAG \
           ${CONTAINER_REVERSEPROXY_NAME}:${CONTAINER_REVERSEPROXY_TAG}