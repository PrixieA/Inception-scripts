#! /bin/sh

sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw allow ssh
sudo ufw allow 443
sudo ufw enable
sudo ufw status

sleep 10
