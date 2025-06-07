# Imagen Base
FROM ubuntu:24.04

# Variables
ARG CONTAINER_NAME
ARG CONTAINER_VERSION
ARG ENTRYPOINT
ARG RASPBERRY_IP

# Directorio de Trabajo
WORKDIR /app

# Update e Instalaciones Base
RUN apt update
RUN apt install -y software-properties-common
RUN apt install -y vim

# Instalando Ansible
RUN add-apt-repository --yes --update ppa:ansible/ansible && \
    apt install -y ansible && \
    apt clean all

# Creando directorio para Ansible
RUN mkdir -p /app/ansible

# Copiando Archivos
COPY myhomelab-playbook.sh /app/myhomelab-playbook.sh
COPY variables.env /app/variables.env
COPY ansible/ /app/ansible

# Ejecutando el Entrypoint
ENTRYPOINT [ "/bin/bash", "-c", "/app/myhomelab-playbook.sh" ]
CMD []