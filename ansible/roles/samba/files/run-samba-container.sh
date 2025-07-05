#!/bin/bash

# Bash script encargado de correr la imagen del contenedor de Samba

source $1

docker run --rm -it -d \
           -v /mnt/external:/app/shares \
           -p 445:445 \
           -p 139:139 \
           -e CONTAINER_SAMBA_NAME \
           -e CONTAINER_SAMBA_TAG \
           ${CONTAINER_SAMBA_NAME}:${CONTAINER_SAMBA_TAG} \
           /bin/bash -c "tail -f /dev/null"