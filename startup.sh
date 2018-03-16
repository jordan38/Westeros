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

NGINX_CONF_CHEMIN=/opt/dockers/nginx/conf
NGINX_SITES_AVAILABLE_CHEMIN=/opt/dockers/nginx/conf/sites-available
NGINX_SITES_ENABLED_CHEMIN=/opt/dockers/nginx/conf/sites-enabled

# Les fichiers de configurations globaux
mkdir -p $NGINX_CONF_CHEMIN
wget -O https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/conf/nginx.conf -P $NGINX_CONF_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/conf/mime.types -P $NGINX_CONF_CHEMIN
# Les fichiers de configuration des servers block
mkdir -p $NGINX_SITES_AVAILABLE_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/sites-available/nextcloud.eastwatch.me.conf -P $NGINX_SITES_AVAILABLE_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/sites-available/portainer.eastwatch.me.conf -P $NGINX_SITES_AVAILABLE_CHEMIN
# Les fichiers de configuration des servers block activés
mkdir -p $NGINX_SITES_ENABLED_CHEMIN
ln -s /opt/dockers/nginx/conf/sites-available/nextcloud.eastwatch.me.conf /opt/dockers/nginx/conf/sites-enabled/nextcloud.eastwatch.me.conf
ln -s /opt/dockers/nginx/conf/sites-available/portainer.eastwatch.me.conf /opt/dockers/nginx/conf/sites-enabled/portainer.eastwatch.me.conf

## Recuperer le docker-compose.yml
echo "Mise en place du docker compose file"

mkdir -p $SCRIPT_MAINTENANCE_DOSSIER
wget -O https://raw.githubusercontent.com/jordan38/Westeros/master/docker/docker-compose.yml -P $SCRIPT_MAINTENANCE_DOSSIER

## Mise en place des scripts de maintenance
echo "Mise en place des scripts de maintenance"

wget -O https://raw.githubusercontent.com/jordan38/Westeros/master/update.sh -P $SCRIPT_MAINTENANCE_DOSSIER
