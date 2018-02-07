#!/bin/bash

# Constante
UTILISATEUR_COURANT=whoami

# Configurer nano

sudo apt-get update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install docker-ce

# Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $USER
