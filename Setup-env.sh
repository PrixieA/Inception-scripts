#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-env.sh)"

echo "DOMAIN_NAME=$USER.42.fr" >> ~/Inception/srcs/.en
echo '\n' >> ~/Inception/srcs/.en
echo 'SQL_DATABASE=inception' >> ~/Inception/srcs/.en
echo 'SQL_USER=dbuser' >> ~/Inception/srcs/.en
echo 'SQL_PASSWORD=dbpassword' >> ~/Inception/srcs/.en
echo 'SQL_ROOT_PASSWORD=password' >> ~/Inception/srcs/.en
echo 'SQL_HOST=mariadb:3306' >> ~/Inception/srcs/.en
echo '\n' >> ~/Inception/srcs/.en
echo 'SITE_TITLE=Inception' >> ~/Inception/srcs/.en
echo 'ADMIN_USER=hello' >> ~/Inception/srcs/.en
echo 'ADMIN_PASSWORD=wppassword' >> ~/Inception/srcs/.en
echo "ADMIN_EMAIL="$USER"_admin@example.com" >> ~/Inception/srcs/.en
echo "USER1_LOGIN="$USER"_test8" >> ~/Inception/srcs/.en
echo "USER1_MAIL="$USER"_user@example.com" >> ~/Inception/srcs/.en
echo 'USER1_PASS=password' >> ~/Inception/srcs/env
