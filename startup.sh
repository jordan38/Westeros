#!/bin/bash

UTILISATEUR_COURANT=$(whoami)

## Lancement du script
#apt-get update

#apt-get upgrade

## Installation Nano
echo -e "Installation Nano"

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
DDCLIENT_CHEMIN=/var/ddclient/config

mkdir -p $DDCLIENT_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/ddclient/ddclient.conf -P $DDCLIENT_CHEMIN

## Récuperer les fichiers nginx
echo "Mise en place des fichiers nginx"

NGINX_CONF_CHEMIN=/var/nginx
NGINX_HTML_CHEMIN=/var/nginx/html
NGINX_SITES_AVAILABLE_CHEMIN=/var/nginx/sites-available
NGINX_SITES_ENABLED_CHEMIN=/var/nginx/conf.d

# Les fichiers de configurations globaux
mkdir -p $NGINX_CONF_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/conf/nginx.conf -P $NGINX_CONF_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/conf/mime.types -P $NGINX_CONF_CHEMIN
# Les fichiers de configuration des servers block
mkdir -p $NGINX_SITES_AVAILABLE_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/sites-available/nextcloud.eastwatch.me -P $NGINX_SITES_AVAILABLE_CHEMIN
wget https://raw.githubusercontent.com/jordan38/Westeros/master/nginx/sites-available/portainer.eastwatch.me -P $NGINX_SITES_AVAILABLE_CHEMIN
# Les fichiers de configuration des servers block activés
mkdir -p $NGINX_SITES_ENABLED_CHEMIN
#cp /var/nginx/sites-available/nextcloud.eastwatch.me /var/nginx/conf.d/nextcloud.eastwatch.me.conf
ln -s /var/nginx/sites-available/portainer.eastwatch.me /var/nginx/conf.d/portainer.eastwatch.me.conf

## Recuperer le docker-compose.yml
echo "Mise en place du docker compose file"
SCRIPT_MAINTENANCE_DOSSIER=/home/script

mkdir -p $SCRIPT_MAINTENANCE_DOSSIER
wget https://raw.githubusercontent.com/jordan38/Westeros/master/docker/docker-compose.yml -P $SCRIPT_MAINTENANCE_DOSSIER
