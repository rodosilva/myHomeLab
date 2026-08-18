# Imagen Base
FROM nginx:alpine

# Directorio de Trabajo
WORKDIR /app

# Update e Instalaciones Base

# Copiar certificados SSL
COPY ./certs/cert.pem /etc/nginx/certs/cert.pem
COPY ./certs/key.pem /etc/nginx/certs/key.pem

# Copiar archivo de configuración de NGINX para Vaultwarden
COPY ./vaultwarden.conf /etc/nginx/conf.d/vaultwarden.conf

# Publicar Puerto
EXPOSE 80
EXPOSE 443

# Run NGINX in the foreground so the Docker container stays alive
CMD ["nginx", "-g", "daemon off;"]
