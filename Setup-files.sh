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

# WordPress

mkdir ~/Inception/srcs/requirements/wordpress/conf
touch ~/Inception/srcs/requirements/wordpress/Dockerfile
touch ~/Inception/srcs/requirements/wordpress/.dockerignore
mkdir ~/Inception/srcs/requirements/wordpress/tools

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

sleep 20

clear

# Config of MariaDB

echo "Now MariaDB"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-mariadb.sh)"

sleep 20

clear

# Config of WordPress

echo "Now WordPress"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-wordpress.sh)"

sleep 20

clear

# Config of docker-compose

echo "Now docker-compose"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-dock-compose.sh)"

sleep 20


clear
# Config of env

echo "Now env"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-env.sh)"

sleep 20

clear

# Config of Makefile

echo "now Makefile"

sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-makefile.sh)"

sleep 20

clear
