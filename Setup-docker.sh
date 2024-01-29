#! /bin/sh

# To use the file without downloading it use : sh -c "$(wget -O- https://raw.githubusercontent.com/PrixieA/Inception-scripts/master/Setup-docker.sh)"

# To uninstall any conflicting packages

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

clear

# Installation

# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

sleep 15

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sleep 15

clear

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sleep 15

clear

# Test if it works

echo -e "Test :\n"

sudo docker run hello-world

sleep 15

clear

# To execute without sudo

sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

sleep 15

clear
