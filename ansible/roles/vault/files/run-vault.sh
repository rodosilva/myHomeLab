# Este script se encarga de correr el contenedor de vaultwarden
# Junto a sus configuraciones necesarias.

docker run -d \
 --name vaultwarden \
 --user $(id -u raspberry):$(id -g raspberry) \
 --network homelab \
 --volume /home/rodrigo/secrets/:/data \
 --restart=unless-stopped \
 vaultwarden/server:latest
