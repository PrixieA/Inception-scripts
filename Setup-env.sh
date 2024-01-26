#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-env.sh)"

echo "DOMAIN_NAME=$USER.42.fr" >> ~/Inception/srcs/.env
echo '\n' >> ~/Inception/srcs/.env
echo 'SQL_DATABASE=inception' >> ~/Inception/srcs/.env
echo 'SQL_USER=dbuser' >> ~/Inception/srcs/.env
echo 'SQL_PASSWORD=dbpassword' >> ~/Inception/srcs/.env
echo 'SQL_ROOT_PASSWORD=password' >> ~/Inception/srcs/.env
echo 'SQL_HOST=mariadb:3306' >> ~/Inception/srcs/.env
echo '\n' >> ~/Inception/srcs/.env
echo 'SITE_TITLE=Inception' >> ~/Inception/srcs/.env
echo 'ADMIN_USER=hello' >> ~/Inception/srcs/.env
echo 'ADMIN_PASSWORD=wppassword' >> ~/Inception/srcs/.env
echo "ADMIN_EMAIL="$USER"_admin@example.com" >> ~/Inception/srcs/.env
echo USER1_LOGIN="$USER"_test8 >> ~/Inception/srcs/.env
echo USER1_MAIL="$USER"_user@example.com >> ~/Inception/srcs/.env
echo 'USER1_PASS=password' >> ~/Inception/srcs/.env
