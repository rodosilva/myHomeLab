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

ansible-playbook -i ./ansible/inventory.ini ./ansible/myhomelab-playbook.yaml