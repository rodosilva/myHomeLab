# Este script se encarga de descargar la imagen de vaultwarden y de crear los
# persistent volumes

# Verificamos si la imagen ya existe
if [[ -z $(docker images | grep -o vaultwarden/server) ]]; then
  echo "No existe la imagen vaultwarden/server, descargando..."
  docker pull vaultwarden/server:latest
else
    echo "La imagen vaultwarden/server ya existe..."
fi