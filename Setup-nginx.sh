#! /bin/sh

# Writting in Dockerfile 

echo -e 'FROM debian:bullseye' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN apt-get update -y' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN apt-get install -y nginx' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN apt-get install -y vim' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN apt-get install -y curl' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN mkdir -p /etc/nginx/ssl' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN apt-get install -y openssl' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${USER}.42.fr/UID=${USER}"' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN mkdir -p /var/run/nginx' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'COPY ./conf/nginx.conf /etc/nginx/nginx.conf' >> ~/Inception/srcs/requirements/nginx/Dockerfile

# RUN: This command runs any command in the Docker image.
# apt-get -y: The -y option allows you to answer YES to this kind of question. Do you want to continue? [Y/n] Abort.
# mkdir -p: The -p option tells the mkdir command to create any parent directories that do not already exist. 
# COPY: The command is used to copy files from the build context to a specific location in the container's filesystem. 

# Build a docker container

docker build -t nginx ~/Inception/srcs/requirements/nginx
docker image ls
docker run -it nginx
docker container ls

# Configuration file

echo -e 'user www-data;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e 'pid /run/nginx.pid;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e 'include etc/nginx/modules-enabled/*.conf;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e 'events' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\tworker_connections 1024;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e 'http' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\tserver' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tlisten 443 ssl;' >> ~Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tlisten [::]:443 ssl;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\troot /var/www/html/wordpress;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tserver_name ${USER}.42.fr;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tindex index.php index.html index.htm index.nginx-debian.html;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tlocation / ' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\tinclude /etc/nginx/mime.types;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\ttry_files $uri $uri/ =404;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tlocation ~ \.php$' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\tfastcgi_split_path_info ^(.+\.php)(/.+)$;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\t\fastcgi_param SCRIPT_FILENAME $request_filename;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\tinclude fastcgi_params;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\tfastcgi_pass wordpress:9000;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t\tfastcgi_param HTTPS on;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\t}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tssl_protocols TLSv1.2 TLSv1.3;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tssl_certificate /etc/nginx/ssl/inception.crt;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tssl_certificate_key /etc/nginx/ssl/inception.key;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\taccess_log /var/log/nginx/access.log;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\terror_log /var/log/nginx/error.log;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t\tgzip on;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '\t}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo -e '}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf

# New cmds on Dockerfile

echo -e '\n' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN chmod 755 /var/www/html' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'RUN chown -R www-data:www-data /var/www/html' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo -e 'CMD ["nginx", "-g", "daemon off;"]' >> ~/Inception/srcs/requirements/nginx/Dockerfile
