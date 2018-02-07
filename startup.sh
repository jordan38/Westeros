#!/bin/bash

UTILISATEUR_COURANT=$(whoami)

echo je suis content $UTILISATEUR_COURANT
# Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $UTILISATEUR_COURANT
