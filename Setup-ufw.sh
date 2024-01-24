#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-ufw.sh)"

sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw allow ssh
sudo ufw allow 443
sudo ufw enable
sudo ufw status

sleep 10
