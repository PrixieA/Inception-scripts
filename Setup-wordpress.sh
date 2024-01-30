#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-wordpress.sh)"

# Config Dockerfile

echo 'FROM debian:buster' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN apt-get update -y' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN apt-get upgrade -y' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN apt-get install -y wget' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN apt-get install -y php7.4 php-fpm php-mysql' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile

# A command-line interface for WordPress, you can manage WordPress once it's downloaded

echo 'RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '	&& chmod +x wp-cli.phar \' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '	&& mv wp-cli.phar /usr/local/bin/wp' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN apt-get update && apt-get install -y default-mysql-client' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN apt-get install -y mariadb-client' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN wget https://wordpress.org/wordpress-6.2.1.tar.gz -P /var/www/html' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN cd /var/www/html \' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '	&& tar -xzf /var/www/html/wordpress-6.1.1.tar.gz \' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '	&& rm /var/www/html/wordpress-6.1.1.tar.gz' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile

# Ensure that the web server(nginx) has the necessary permissions to read and execute the files within the web root directory

echo 'RUN chown -R www-data:www-data /var/www/*' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN chmod -R 755 /var/www/*' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'EXPOSE 9000' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'COPY ./tools/wpscript.sh ./' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'RUN chmod +x ./wpscript.sh' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo '\n' >> ~/Inception/srcs/requirements/wordpress/Dockerfile
echo 'ENTRYPOINT ["bash", "./wpscript.sh"]' >> ~/Inception/srcs/requirements/wordpress/Dockerfile

# Writting wordpress script

echo '#! /bin/bash' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'cd /var/www/html/wordpress' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'if ! wp core is-installed; then' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'wp config create	--allow-root --dbname=${SQL_DATABASE} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--dbuser=${SQL_USER} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--dbpass=${SQL_PASSWORD} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--dbhost=${SQL_HOST} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--url=https://${DOMAIN_NAME};' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'wp core install	--allow-root \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--url=https://${DOMAIN_NAME} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--title=${SITE_TITLE} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--admin_user=${ADMIN_USER} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--admin_password=${ADMIN_PASSWORD} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--admin_email=${ADMIN_EMAIL};' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'wp user create		--allow-root \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			${USER1_LOGIN} ${USER1_MAIL} \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--role=author \' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '			--user_pass=${USER1_PASS} ;' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'wp cache flush --allow-root' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh

# It provides an easy-to-use interface for creating custom contact forms and managing submissions, as well as supporting various anti-spam techniques

echo 'wp plugin install contact-form-7 --allow-root --activate' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh

# Set the site language to English

echo 'wp language core install en_US --allow-root --activate' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh

# Remove default themes and plugins

echo 'wp theme delete twentynineteen twentytwenty --allow-root' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'wp plugin delete hello --allow-root' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh

# Set the permalink structure

echo 'wp rewrite structure '"'"'/%postname%/'"'" >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'fi' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'if [ ! -d /run/php ]; then' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '	mkdir /run/php;' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo 'fi' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh

# Start the PHP FastCGI Process Manager (FPM) for PHP version 7.3 in the foreground

echo 'exec /usr/sbin/php-fpm7.3 -F -R' >> ~/Inception/srcs/requirements/wordpress/tools/wpscript.sh

# Config PHP

echo '[www]' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'user = www-data' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'group = www-data' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'listen = 9000' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'listen.owner = www-data' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'listen.group = www-data' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo '\n' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'pm = dynamic' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'pm.max_children = 5' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'pm.start_servers = 2' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'pm.min_spare_servers = 1' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'pm.max_spare_servers = 3' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'pm.max_requests = 100' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
echo 'clear_env = no' >> ~/Inception/srcs/requirements/wordpress/tools/www.conf
