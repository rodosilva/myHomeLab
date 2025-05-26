# Este script se encarga de correr el contenedor de jellyfin/jellyfin
# Junto a sus configuraciones necesarias.

docker run -d \
 --name jellyfin \
 --user $(id -u rodo):$(id -g rodo) \
 --net=host \
 --volume jellyfin-config:/config \
 --volume jellyfin-cache:/cache \
 --restart=unless-stopped \
 -p 8096:8096 \
 jellyfin/jellyfin

 # --mount type=bind,source=/path/to/media,target=/media \
 # http://192.168.1.11:8096/web/#/wizardstart.html