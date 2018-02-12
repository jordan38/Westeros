#!/bin/bash

# Constante
UTILISATEUR_COURANT=whoami

# Configurer nano

sudo apt-get update

# Serveur SSH

echo 'Installation SSH'
sudo apt install openssh-server

# Docker
echo 'Installation Docker'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install docker-ce

# Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $USER

# Portainer

# mise en place de docker-compose
echo 'Installation Docker compose'
sudo curl -L --fail https://github.com/docker/compose/releases/download/1.19.0/run.sh -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Recuperer le docker-compose

wget https://raw.githubusercontent.com/jordan38/Westeros/master/docker-compose.yml -O /tmp

# Mettre en place les fichiers de configurations
## ddclient

## dnsmasq

## nginx

# Personnaliser la ligne de commande + zsch https://github.com/robbyrussell/oh-my-zsh + autocomplete

# Test des services ?

# Back up container
