# Este script se encarga de descargar la imagen de jellyfin/jellyfin y de crear los
# persistent volumes

# Verificamos si la imagen ya existe
if [[ -z $(docker images | grep -o jellyfin/jellyfin) ]]; then
  echo "No existe la imagen jellyfin/jellyfin, descargando..."
  docker pull jellyfin/jellyfin
else
    echo "La imagen jellyfin/jellyfin ya existe..."
fi

# Verificamos si los volúmenes ya existen
if [[ -z $(docker volume ls | grep -o jellyfin-config) ]]; then
  echo "No existe el volumen jellyfin-config, creando..."
  docker volume create jellyfin-config
else
    echo "El volumen jellyfin-config ya existe..."
fi

if [[ -z $(docker volume ls | grep -o jellyfin-cache) ]]; then
  echo "No existe el volumen jellyfin-cache, creando..."
  docker volume create jellyfin-cache
else
    echo "El volumen jellyfin-cache ya existe..."
fi
