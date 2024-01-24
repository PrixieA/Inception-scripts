#! /bin/sh

# Sudo

usermod -aG sudo parracha
getent group sudo
sudo visudo # add username	ALL=(ALL:ALL) ALL under sudo	ALL=(ALL:ALL) ALL

clear

# Install

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y wget

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y build-essential

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y openssh-server

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y zsh

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y ufw

clear

# Change the default graphical runlevel

sudo systemctl set-default graphical.target
sudo vim /etc/pam.d/gdm-password # comment the line : auth required pam_succeed_if.so user != root quite_success

# reboot

clear
echo -e "The computer will reboot in 20s, use ctrl+c if you don't want to reboot"
sleep 20

sudo reboot