#!/bin/bash

CHEMIN_DOSSIER_SCRIPT=/home/script
CHEMIN_FICHIER_COMPOSE=/home/script/docker-compose.yml

if [ -f $CHEMIN_FICHIER_COMPOSE ]; then
    rm -f $file
fi

wget https://raw.githubusercontent.com/jordan38/Westeros/master/docker/docker-compose.yml -P $CHEMIN_DOSSIER_SCRIPT
