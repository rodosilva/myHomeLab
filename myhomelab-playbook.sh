#!/bin/bash

# Variables
source variables.env

# Las llaves
echo "Activando servicio..."
eval "$(ssh-agent -s)"
echo "Añadiendo llaves..."
ssh-add /root/.ssh/id_ed25519
echo "Añadiendo a known_hosts..."
ssh-keyscan -t ed25519 ${RASPBERRY_IP} | tee /root/.ssh/known_hosts
echo "Listando llaves..."
ssh-add -l

ansible-playbook -K -i ./ansible/inventory.ini ./ansible/myhomelab-playbook.yaml --extra-vars "CONTAINER_SAMBA_NAME=${CONTAINER_SAMBA_NAME} CONTAINER_SAMBA_TAG=${CONTAINER_SAMBA_TAG} DIR_PROJECT=${DIR_PROJECT}"