#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-makefile.sh)"

# Config of Makefile

echo 'all: ' >> ~/Inception/Makefile
echo '	mkdir -p /home/'"$USER"'/data/mariadb' >> ~/Inception/Makefile
echo '	mkdir -p /home'"$USER"'/data/wordpress' >> ~/Inception/Makefile
echo '	docker compose -f ./srcs/docker-compose.yml build' >> ~/Inception/Makefile
echo '	docker compose -f ./srcs/docker-compose.yml up -d' >> ~/Inception/Makefile
echo '\n' >> ~/Inception/Makefile
echo 'logs:' >> ~/Inception/Makefile
echo '	docker logs wordpress' >> ~/Inception/Makefile
echo '	docker logs mariadb' >> ~/Inception/Makefile
echo '	docker logs nginx' >> ~/Inception/Makefile
echo '\n' >> ~/Inception/Makefile
echo 'clean:' >> ~/Inception/Makefile
echo '	docker container stop nginx mariadb wordpress' >> ~/Inception/Makefile
echo '	docker network rm inception' >> ~/Inception/Makefile
echo '\n' >> ~/Inception/Makefile
echo 'fclean: clean' >> ~/Inception/Makefile
echo '	@sudo rm -rf /home/yatang/data/mariadb/*' >> ~/Inception/Makefile
echo '	@sudo rm -rf /home/yatang/data/wordpress/*' >> ~/Inception/Makefile
echo '	@docker system prune -af' >> ~/Inception/Makefile
echo '\n' >> ~/Inception/Makefile
echo 're: fclean all' >> ~/Inception/Makefile
echo '\n' >> ~/Inception/Makefile
echo '.Phony: all logs clean fclean' >> ~/Inception/Makefile
