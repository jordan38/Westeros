#!/bin/bash

$USER=whoami
echo je suis $USER
# Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $USER
