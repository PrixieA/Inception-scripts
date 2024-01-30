#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-nginx.sh)"

# Writting in Dockerfile 

echo 'FROM debian:bullseye' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN apt-get update -y' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN apt-get install -y nginx' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN apt-get install -y vim' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN apt-get install -y curl' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN mkdir -p /etc/nginx/ssl' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN apt-get install -y openssl' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${USER}.42.fr/UID=${USER}"' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN mkdir -p /var/run/nginx' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'COPY ./conf/nginx.conf /etc/nginx/nginx.conf' >> ~/Inception/srcs/requirements/nginx/Dockerfile

# RUN: This command runs any command in the Docker image.
# apt-get -y: The -y option allows you to answer YES to this kind of question. Do you want to continue? [Y/n] Abort.
# mkdir -p: The -p option tells the mkdir command to create any parent directories that do not already exist. 
# COPY: The command is used to copy files from the build context to a specific location in the container's filesystem. 

# Build a docker container

docker build -t nginx ~/Inception/srcs/requirements/nginx
docker image ls
docker run -it nginx
exit
docker container ls

# Configuration file

echo 'user www-data;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo 'pid /run/nginx.pid;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo 'include etc/nginx/modules-enabled/*.conf;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo 'events' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '	worker_connections 1024;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo 'http' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '	server' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '	{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		listen 443 ssl;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		listen [::]:443 ssl;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		root /var/www/html/wordpress;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		server_name ${USER}.42.fr;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		index index.php index.html index.htm index.nginx-debian.html;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		location / ' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			include /etc/nginx/mime.types;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			try_files $uri $uri/ =404;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		location ~ \.php$' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		{' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			fastcgi_split_path_info ^(.+\.php)(/.+)$;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			fastcgi_param SCRIPT_FILENAME $request_filename;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			include fastcgi_params;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			fastcgi_pass wordpress:9000;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '			fastcgi_param HTTPS on;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		ssl_protocols TLSv1.2 TLSv1.3;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		ssl_certificate /etc/nginx/ssl/inception.crt;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		ssl_certificate_key /etc/nginx/ssl/inception.key;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		access_log /var/log/nginx/access.log;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		error_log /var/log/nginx/error.log;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '\n' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '		gzip on;' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '	}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf
echo '}' >> ~/Inception/srcs/requirements/nginx/conf/nginx.conf

# New cmds on Dockerfile

echo '\n' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN chmod 755 /var/www/html' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'RUN chown -R www-data:www-data /var/www/html' >> ~/Inception/srcs/requirements/nginx/Dockerfile
echo 'CMD ["nginx", "-g", "daemon off;"]' >> ~/Inception/srcs/requirements/nginx/Dockerfile
