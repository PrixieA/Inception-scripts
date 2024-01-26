#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-files.sh)"

# Creation of all files

# Base

mkdir ~/Inception
touch ~/Inception/Makefile
mkdir ~/Inception/srcs

# Sources

mkdir ~/Inception/srcs/requirements
touch ~/Inception/srcs/.env
touch ~/Inception/srcs/docker-compose.yml

# Requirements

mkdir ~/Inception/srcs/requirements/mariadb
mkdir ~/Inception/srcs/requirements/nginx
mkdir ~/Inception/srcs/requirements/tools
mkdir ~/Inception/srcs/requirements/wordpress

# Mariadb

mkdir ~/Inception/srcs/requirements/mariadb/conf
touch ~/Inception/srcs/requirements/mariadb/Dockerfile
touch ~/Inception/srcs/requirements/mariadb/.dockerignore
mkdir ~/Inception/srcs/requirements/mariadb/tools

# Nginx

mkdir ~/Inception/srcs/requirements/nginx/conf
touch ~/Inception/srcs/requirements/nginx/Dockerfile
touch ~/Inception/srcs/requirements/nginx/.dockerignore
mkdir ~/Inception/srcs/requirements/nginx/tools

clear

cd ~/Inception
ls -alR

sleep 15

clear

echo -e "In 20s, the scripts will begin to configurate the files, if you want to do it later or by yourself, use ctrl+c"

sleep 20

# Files config

# Config of NGINX

echo "Let's begin with the config of NGINX"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-nginx.sh)"

clear

sleep 20

# Config of MariaDB

echo "Now MariaDB"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-mariadb.sh)"

clear

sleep 20

# Config of WordPress

echo "Now WordPress"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-wordpress.sh)"

clear

sleep 20

# Config of docker-compose

echo "Now docker-compose"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-dock-compose.sh)"

clear

sleep 20

# Config of env

echo "Now env"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-env.sh)"

clear

sleep 20

# Config of Makefile

echo "now Makefile"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-makefile.sh)"

clear

sleep 20
