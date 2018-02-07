#!/bin/bash

$USER=$(whoami)
echo $USER
# Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $USER
