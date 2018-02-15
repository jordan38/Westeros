#!/bin/bash

UTILISATEUR_COURANT=$(whoami)
DDCLIENT_CHEMIN=/opt/dockers/ddclient/config
COMPOSE_FICHIER_CHEMIN=~/devs

sudo apt-get update

## Nano
echo "Installation Nano"

sudo apt-get install nano

## Serveur SSH

echo "Installation SSH"
sudo apt install openssh-server

## Docker
echo "Installation Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install docker-ce

## Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $UTILISATEUR_COURANT

## Mise en place de docker-compose
echo "Installation Docker compose"
sudo curl -L --fail https://github.com/docker/compose/releases/download/1.19.0/run.sh -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## Récuperer le fichier de conf de ddclient
echo "Mise en place des fichiers de configuration"

sudo mkdir -p $DDCLIENT_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/ddclient/ddclient.conf $DDCLIENT_CHEMIN

## Recuperer le docker-compose.yml
echo "Mise en place du docker compose file"

sudo mkdir -p $COMPOSE_FICHIER_CHEMIN
wget https://github.com/jordan38/Westeros/blob/master/docker/docker-compose.yml $COMPOSE_FICHIER_CHEMIN

