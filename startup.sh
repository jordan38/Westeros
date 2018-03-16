#!/bin/bash

UTILISATEUR_COURANT=$(whoami)
DDCLIENT_CHEMIN=/opt/dockers/ddclient/config
SCRIPT_MAINTENANCE_DOSSIER=~/devs

apt-get update

## Nano
echo "Installation Nano"

apt-get -y install nano

## Serveur SSH

echo "Installation SSH"
apt-get -y install openssh-server

## Htop
echo "Installation htop"

apt-get -y install htop

## Docker
echo "Installation Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update

apt-get -y install docker-ce

## Ajoute l'utilisateur au groupe docker
usermod -a -G docker $UTILISATEUR_COURANT

## Mise en place de docker-compose
echo "Installation Docker compose"
curl -L --fail https://github.com/docker/compose/releases/download/1.19.0/run.sh -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

## Récuperer le fichier de conf de ddclient
echo "Mise en place des fichiers de configuration"

mkdir -p $DDCLIENT_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/ddclient/ddclient.conf -P $DDCLIENT_CHEMIN

## Récuperer les fichiers nginx
echo "Mise en place des fichiers nginx"

mkdir -p 
wget -p nginx/conf
wget -p nginx/conf
mkdir -p
wget -p nginx/site-available
wget -p nginx/site-available
mkdir -p site-enabled
ln -s /etc/nginx/sites-available/.me /etc/nginx/sites-enabled/.me
ln -s /etc/nginx/sites-available/.me /etc/nginx/sites-enabled/.me

## Recuperer le docker-compose.yml
echo "Mise en place du docker compose file"

mkdir -p $SCRIPT_MAINTENANCE_DOSSIER
wget https://raw.githubusercontent.com/jordan38/Westeros/master/docker/docker-compose.yml -P $SCRIPT_MAINTENANCE_DOSSIER

## Mise en place des scripts de maintenance
echo "Mise en place des scripts de maintenance"

wget https://raw.githubusercontent.com/jordan38/Westeros/master/update.sh -P $SCRIPT_MAINTENANCE_DOSSIER
