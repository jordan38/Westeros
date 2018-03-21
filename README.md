#### Comment mettre en place le serveur Westeros

Pré-requis :
* Définir une ip static sur le serveur
* Définir les redirections de port nécessaires
* Définir le DynHost sur https://www.ovh.com/manager/web/index.html
* Définir les Zones DNS sur https://www.ovh.com/manager/web/index.html

Executer le script startup 
> curl https://raw.githubusercontent.com/jordan38/Westeros/master/startup.sh | sudo bash
> reboot now

Mettre à jour le fichier de configuration ddclient 
> /var/ddclient/conf/ddclient.conf

Exécuter le docker compose file
> docker-compose -f /home/script/docker-compose.yml pull
> docker-compose -f /home/script/docker-compose.yml up -d

Services :
* ddclient : permet de mettre à jour un nom de domaine avec une IP dynamique
* Nginx : reverse proxy
