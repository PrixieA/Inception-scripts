#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-dock-compose.sh)"

# Config of docker compose

echo 'version: '"'"3"'" >> ~/Inception/srcs/docker-compose.yml
echo '\n' >> ~/Inception/srcs/docker-compose.yml
echo 'services:' >> ~/Inception/srcs/docker-compose.yml
echo '  mariadb:' >> ~/Inception/srcs/docker-compose.yml
echo '    image: mariadb' >> ~/Inception/srcs/docker-compose.yml
echo '    container_name: mariadb' >> ~/Inception/srcs/docker-compose.yml
echo '    build:' >> ~/Inception/srcs/docker-compose.yml
echo '      context: ./requirements/mariadb' >> ~/Inception/srcs/docker-compose.yml
echo '      dockerfile: Dockerfile' >> ~/Inception/srcs/docker-compose.yml
echo '    volumes:' >> ~/Inception/srcs/docker-compose.yml
echo '      - mariadb:/var/lib/mysql' >> ~/Inception/srcs/docker-compose.yml
echo '    expose:' >> ~/Inception/srcs/docker-compose.yml
echo '      - "3306"' >> ~/Inception/srcs/docker-compose.yml
echo '    networks:' >> ~/Inception/srcs/docker-compose.yml
echo '      - inception' >> ~/Inception/srcs/docker-compose.yml
echo '    restart: unless-stopped' >> ~/Inception/srcs/docker-compose.yml
echo '    env_file: .env' >> ~/Inception/srcs/docker-compose.yml
echo '    healthcheck:' >> ~/Inception/srcs/docker-compose.yml
echo '      test: mysqladmin ping --host=localhost -p${SQL_ROOT_PASSWORD}' >> ~/Inception/srcs/docker-compose.yml
echo '      interval: 5s' >> ~/Inception/srcs/docker-compose.yml
echo '      timeout: 1s' >> ~/Inception/srcs/docker-compose.yml
echo '      retries: 20' >> ~/Inception/srcs/docker-compose.yml
echo '      start_period: 5s' >> ~/Inception/srcs/docker-compose.yml
echo '\n' >> ~/Inception/srcs/docker-compose.yml
echo '  wordpress:' >> ~/Inception/srcs/docker-compose.yml
echo '    image: wordpress' >> ~/Inception/srcs/docker-compose.yml
echo '    container_name: wordpress' >> ~/Inception/srcs/docker-compose.yml
echo '    build:' >> ~/Inception/srcs/docker-compose.yml
echo '      context: ./requirements/wordpress' >> ~/Inception/srcs/docker-compose.yml
echo '      dockerfile: Dockerfile' >> ~/Inception/srcs/docker-compose.yml
echo '    volumes:' >> ~/Inception/srcs/docker-compose.yml
echo '      - wordpress:/var/www/html/wordpress' >> ~/Inception/srcs/docker-compose.yml
echo '    expose:' >> ~/Inception/srcs/docker-compose.yml
echo '      - "9000"' >> ~/Inception/srcs/docker-compose.yml
echo '    networks:' >> ~/Inception/srcs/docker-compose.yml
echo '      - inception' >> ~/Inception/srcs/docker-compose.yml
echo '    restart: unless-stopped' >> ~/Inception/srcs/docker-compose.yml
echo '    env_file: .env' >> ~/Inception/srcs/docker-compose.yml
echo '    depends_on:' >> ~/Inception/srcs/docker-compose.yml
echo '      mariadb:' >> ~/Inception/srcs/docker-compose.yml
echo '        condition: service_healthy   ' >> ~/Inception/srcs/docker-compose.yml
echo '\n' >> ~/Inception/srcs/docker-compose.yml
echo '  nginx:' >> ~/Inception/srcs/docker-compose.yml
echo '    image: nginx' >> ~/Inception/srcs/docker-compose.yml
echo '    container_name: nginx' >> ~/Inception/srcs/docker-compose.yml
echo '    build:' >> ~/Inception/srcs/docker-compose.yml
echo '      context: ./requirements/nginx' >> ~/Inception/srcs/docker-compose.yml
echo '      dockerfile: Dockerfile' >> ~/Inception/srcs/docker-compose.yml
echo '    volumes:' >> ~/Inception/srcs/docker-compose.yml
echo '      - wordpress:/var/www/html/wordpress' >> ~/Inception/srcs/docker-compose.yml
echo '    depends_on:' >> ~/Inception/srcs/docker-compose.yml
echo '      - wordpress' >> ~/Inception/srcs/docker-compose.yml
echo '    ports:' >> ~/Inception/srcs/docker-compose.yml
echo '      - "443:443"' >> ~/Inception/srcs/docker-compose.yml
echo '    networks:' >> ~/Inception/srcs/docker-compose.yml
echo '      - inception' >> ~/Inception/srcs/docker-compose.yml
echo '    restart: unless-stopped' >> ~/Inception/srcs/docker-compose.yml
echo '    env_file: .env' >> ~/Inception/srcs/docker-compose.yml
echo '    healthcheck:' >> ~/Inception/srcs/docker-compose.yml
echo '      test: '"'"curl -kfsSL https://localhost:443/status"'" >> ~/Inception/srcs/docker-compose.yml
echo '      interval: 5s' >> ~/Inception/srcs/docker-compose.yml
echo '      timeout: 1s' >> ~/Inception/srcs/docker-compose.yml
echo '      retries: 10' >> ~/Inception/srcs/docker-compose.yml
echo '      start_period: 5s' >> ~/Inception/srcs/docker-compose.yml
echo '\n' >> ~/Inception/srcs/docker-compose.yml
echo 'volumes:' >> ~/Inception/srcs/docker-compose.yml
echo '  mariadb:' >> ~/Inception/srcs/docker-compose.yml
echo '    driver: local' >> ~/Inception/srcs/docker-compose.yml
echo '    driver_opts:' >> ~/Inception/srcs/docker-compose.yml
echo '      type: '"'"none"'" >> ~/Inception/srcs/docker-compose.yml
echo '      o: '"'"bind"'" >> ~/Inception/srcs/docker-compose.yml
echo '      device: '"'"/home/$USER/data/mariadb"'" >> ~/Inception/srcs/docker-compose.yml
echo '  wordpress:' >> ~/Inception/srcs/docker-compose.yml
echo '    driver: local' >> ~/Inception/srcs/docker-compose.yml
echo '    driver_opts:' >> ~/Inception/srcs/docker-compose.yml
echo '      type: '"'"none"'" >> ~/Inception/srcs/docker-compose.yml
echo '      o: '"'"bind"'" >> ~/Inception/srcs/docker-compose.yml
echo '      device: '"'"/home/$USER/data/wordpress"'" >> ~/Inception/srcs/docker-compose.yml
echo '\n' >> ~/Inception/srcs/docker-compose.yml
echo 'networks:' >> ~/Inception/srcs/docker-compose.yml
echo '  inception:' >> ~/Inception/srcs/docker-compose.yml
echo '    name: inception' >> ~/Inception/srcs/docker-compose.yml
