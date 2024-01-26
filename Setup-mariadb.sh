#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-mariadb.sh)"

# Use debian as the base image

echo 'FROM debian:bullseye' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/mariadb/Dockerfile

# Install MariaDB and other dependencies

echo 'RUN apt-get update -y' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN apt-get upgrade -y' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN apt-get install -y mariadb-server' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN apt-get install -y mariadb-client' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN apt-get install -y procps' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/mariadb/Dockerfile

# Copy the provided config file to the container

echo 'COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN mkdir -p /var/run/mysqld' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN mkdir -p /var/lib/mysql' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN chown mysql:mysql /var/run/mysqld/' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN chmod -R 755 /var/run/mysqld/' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN chown mysql:mysql /var/lib/mysql/' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN chmod -R 755 /var/lib/mysql/' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'EXPOSE 3306' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'COPY ./tools/dbscript.sh ./' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'RUN chmod +x ./dbscript.sh' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo 'ENTRYPOINT ["bash", "./dbscript.sh"]' >> ~/Inception/srcs/requirements/mariadb/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/mariadb/Dockerfile

# Line in Dockerfile to copy conf file to the right place

echo 'COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf' >> ~/Inception/srcs/requirements/mariadb/Dockerfile

# Configuration file for mariadb

echo '[server]' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo '[mysqld]' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'user			          = mysql' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'port			          = 3306' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'basedir			        = /usr' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'datadir			        = /var/lib/mysql' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'pid-file            = /var/run/mysqld/mysqld.pid' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'socket			        = /var/run/mysqld/mysqld.sock' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'skip_networking 	  = off' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'max_allowed_packet  = 64M' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf
echo 'log_error           = /var/log/mysql/error.log' >> ~/Inception/srcs/requirements/mariadb/conf/50-server.cnf

# Script for the database

echo '#! /bin/bash' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo '\n' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'service mysql start;' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo '\n' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'mysql -e ''"''CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'"'"'localhost'"'"' IDENTIFIED BY '"'"'${SQL_PASSWORD}'"'"';''"' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'mysql -e ''"''GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'"'"%"'"' IDENTIFIED BY '"'"'${SQL_PASSWORD}'"'"';''"' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'mysql -e "ALTER USER '"'"root"'"@"'"localhost"'"' IDENTIFIED BY '"'"'${SQL_ROOT_PASSWORD}'"'"';''"' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'mysql -e "FLUSH PRIVILEGES;"' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo '\n' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'exec mysqld_safe' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo '\n' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
echo 'echo "MariaDB database and user were created successfully! "' >> ~/Inception/srcs/requirements/mariadb/tools/dbscript.sh
