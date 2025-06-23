# Imagen Base
FROM ubuntu:24.04

# Directorio de Trabajo
WORKDIR /app

# Update e Instalaciones Base
RUN apt update
RUN apt install -y software-properties-common
RUN apt install -y vim

# Instalando Samba
RUN apt install samba

# Creando directorios para Los Shares de Samba
RUN mkdir -p /app/shares


