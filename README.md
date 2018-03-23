#### Comment mettre en place le serveur Westeros

Pré-requis :
* Définir une ip static sur le serveur
* Définir les redirections de port nécessaires
* Définir le DynHost sur https://www.ovh.com/manager/web/index.html
* Définir les Zones DNS sur https://www.ovh.com/manager/web/index.html

Executer le script startup selon l'environnement 
> curl https://raw.githubusercontent.com/jordan38/Westeros/master/startup.sh | sudo bash {environnement}

> reboot now

Mettre à jour le fichier de configuration ddclient 
> nano /var/ddclient/conf/ddclient.conf

Mettre à jour le fichier .smbcredentials
> nano /root/.smbcredentials

Exécuter le docker compose file selon l'environnement
> docker-compose -f /home/script/docker-compose.yml pull

> docker-compose -f /home/script/docker-compose.yml -f /home/script/docker-compose.prod.yml up -d

> docker-compose -f /home/script/docker-compose.override.yml up -d

Services :
* ddclient : permet de mettre à jour un nom de domaine avec une IP dynamique
* Nginx : reverse proxy
* Portainer : supervision des conteneurs docker
* Nextcloud : cloud privé 
