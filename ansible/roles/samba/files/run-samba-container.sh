#!/bin/bash

# Bash script encargado de correr la imagen del contenedor de Samba

source "${DIR_PROJECT}/variables.env"

docker run --rm -it \
           -v /mnt/external:/app/shares \
           -p 445:445 \
           -p 139:139 \
           -e CONTAINER_SAMBA_NAME \
           -e CONTAINER_SAMBA_TAG \
           ${CONTAINER_SAMBA_NAME}:${CONTAINER_SAMBA_TAG}