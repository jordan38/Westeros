#!/bin/bash

$USER=$(whoami)

# Ajoute l'utilisateur au groupe docker
sudo usermod -a -G docker $USER
