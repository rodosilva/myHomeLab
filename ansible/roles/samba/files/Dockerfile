# Imagen Base
FROM ubuntu:24.04

# Directorio de Trabajo
WORKDIR /app

# Update e Instalaciones Base
RUN apt update
RUN apt install -y software-properties-common
RUN apt install -y vim

# Instalando Samba
RUN apt install -y samba

# Creando directorios para Los Shares de Samba
RUN mkdir -p /app/shares

# MODIFICANDO EL ARCHIVO DE CONFIGURACIÓN DE SAMBA
RUN echo '\
[SHAREFOLDER]\n\
path="/app/shares/"\n\
writeable=yes\n\
create mask=0777\n\
directory mask=0777\n\
public=no'\
>> /etc/samba/smb.conf

# CREANDO USUARIO RASPBERRY PARA SER USADO EN EL SHARE
RUN useradd -M -r raspberry

# INICIANDO SERVICIO DE SAMBA
RUN service smbd start

# AÑADIENDO USUARIO AL SMBPASSWD
RUN (echo "raspberry"; echo "raspberry") | smbpasswd -s -a raspberry

CMD ["service", "smbd", "restart", "&&", "tail", "-f", "/dev/null"]