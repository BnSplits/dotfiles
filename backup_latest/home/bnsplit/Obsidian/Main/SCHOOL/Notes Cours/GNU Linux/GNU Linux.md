# Cours
[[Chapitre 01 - géneralité SE.pdf]]
[[Chapitre 02 - Processus - Logiciels libre.pdf]]
[[Linux 103.3 L1.pdf]]
[[Linux 103.3 L2.pdf]]
[[Autres.pdf]]
# Programme
- Généralité des systèmes d'exploitation
- Linux

# Généralité des OS

| Schema d'un systeme d'information (SI) |
| -------------------------------------- |
| Utilisateur                            |
| Applications / Logiciels               |
| Système d'exploitation / OS            |
| HW / Matériel                          |

- Premiere generation  d'OS en **1945 - 1955** 
- Deuxième generation d'OS en **1955 - 1965** Epoque des transistors
- Troisième generation d'OS en **1965 1970** Circuit intégré / Multiprogrammation
- Quatrième generation d'OS en **1970 - 1980** 
- Cinquième generation d'OS en **1980 - 2000** 
- Sixième generation d'OS en **2000 - Aujourd'hui** 

- Ce qui fait le lien / c'est l'interface / c'est le mode de communication entre un logiciel et l'OS c'est _**l'appel système**_ 

- **Un Système d'exploitation** : est présent au cœur de l'ordinateur, coordonnant les taches essentiels a la marche du materiel. C'est du SE que depend la qualité de la gestion des ressources (processeur, mémoire, les périphériques) et la convivialité de l'utilisateur d'un ordinateur. 
- Un SE résout les problèmes relatifs a l'exploitation de l'ordinateur en garantissant :
	 - une gestion efficace, fiable, et économique des ressources physiques/critiques des ordinateurs
	 - Il ordonne et contrôle l'allocation et la gestion des processeurs, des mémoires, des icônes et fenêtres, des périphériques, des réseaux entre les programmes qui les utilisent.
	 - Il assiste les programmes utilisateurs
	 - Il protège les utilisateurs dans le cas d'usage partagé
	 - Il propose à l'utilisateur une abstraction plus simple et plus agréable que le matériel : une machine virtuelle permettant l'interaction avec les utilisateurs en leurs présentant une machine plus simple à exploiter que la machine réel. 

### Classes des SE
- Mono tache :  ( MS Dos )
- Multi tâches : ( Windows, UNIX, Linux, DMS )
- Mono Session : ( Windows 95, Windows 98 )
- Multi Sessions : ( Windows XP, UNIX, Linux )

 - La multiprogrammation fait référence à la façon dont la mémoire est organisée pour gérer différents logiciels

 - **Un processus**: est un programme qui s'execute ainsi que ses données, sa pile, son compteur ordinale, son compteur de pile et autres contenus de registre nécessaire à son execution 

 - Une ressource permet au processus d'avancer, c'est par exemple une portion de la RAM, de la puissance du CPU

- **Un fichier** : est une collection logique d'informations
- **Un système de fichier** : est une collection de fichiers
	- Il peut inclure plusieurs autres objets qui partagent de nombreuses propriétés des fichiers tels que :
		- Les périphériques d'entrée/sortie (E/S)

- **Un chemin (context de fichiers)** : c'est une chaîne de caractères / une chaîne d'octets décrivant la position de ce fichier dans le repertoire ou le système de fichiers
	- Il y a 2 types de chemins : relatifs et absolus 
- Mémoire RAM / ... vive / ... de travail
- Le SE au démarrage se charge dans la RAM
- SWAP = Mémoire virtuelle

# Linux
- **Une distribution** est un SE bâtit sur le noyau Linux et disposant d'applications pré installées 
- **L'ordonnanceur** qui dit à tel processus de se lancer et permet de switcher entre différents processus 
- On peut dire que la multiprogrammation c'est **du temps partagé** 
- Les libertés des logiciels libres :
	- "Lib0" : éxecuter le programme
	- "Lib1" : étudier le fonctionnement du programme et l'adapter à ses besoins
	- "Lib2" : de redistribuer des copies
	- "Lib3" : l'obligation de faire bénéficier la communauté de ses modifications
- **Open Source** : étant utilisé dans les sloguants pour associer llibre et dovision des code source
- On a deux grandes familles de Distributions : 
	- **Debian (Ubuntu,)**
	- **RedHat (Fedora, Centos, RHEL)**
- Le prompt est composé du :
	- Nom utilisateur
	- HostName
- Une commande se présente sous la forme : **Commande {Options} {Parametres}**
- On a deux types de commandes :
	- **Commandes externes (provenant de programmes externes): cat, snap **
	- **Commandes internes (directement dans le noyau) : cd, type,**
	- Pour connaitre le type de la commande on fait : 
		- **type -a {commande}** 
			- Exemple : type -a cd -> cd est une primitive du shell
- Il existe plusieurs "Bash":
	- tsh, sh, csh, bash...
- Considérons que le " / " est considéré comme une option de commande

### Variables d'environnement
- **env** permet de lister / modifier des variables d'environnement ( N'affiche ou n'affecte que les variables exportées accessibles aux processus enfant.)

- **set** permet de lister encore plus de variables d’environnement (: Affecte toutes les variables, locales ou exportées, définies dans le shell courant.)

- **unset** permet _détruire_ une variable crée (avec MYVAR=value)
- **export** permet d'exporter des variables mais uniquement dans pour la session de shell actuelle et toutes celles qui seront dans le même terminal

## Repertoires dans le "/"

- **/home** : contient les répertoires des utilisateurs, où se trouvent leurs fichiers personnels. 
- **/boot** : contient les fichiers nécessaires au démarrage, notamment le noyau et le chargeur d'amorçage (GRUB).  
- **/bin** : contient les commandes exécutables utilisables par tous les utilisateurs, comme `ls`, `cp`, etc.  
- **/dev** : contient les fichiers spéciaux représentant les périphériques (disques, clés USB, imprimantes, etc.).  
- **/etc** : contient les fichiers de configuration du système et des applications.  
- **/lib** : contient les bibliothèques partagées nécessaires au fonctionnement du système et au démarrage.  
- **/media** : contient les points de montage des périphériques amovibles, comme les clés USB ou les CD/DVD.  
- **/opt** : contient les applications installées optionnellement, souvent des logiciels tiers non natifs au système.  
- **/proc** : un pseudo-système de fichiers contenant des informations sur les processus en cours et l'état du noyau.  
- **/root** : répertoire personnel de l'administrateur (root), distinct de _/home_.  
- **/sbin** : contient les commandes système essentielles utilisées principalement par l'administrateur, comme `fdisk`, `fsck`.  
- **/srv** : contient les données spécifiques aux services fournis par le système (comme un serveur web ou FTP).  
- **/usr** : contient les fichiers partagés non essentiels pour le démarrage, comme les binaires utilisateur, les bibliothèques et la documentation.  
- **/tmp** : contient les fichiers temporaires générés par le système ou les applications, souvent nettoyés au redémarrage.  
- **/var** : contient les fichiers de données variables, comme les journaux système, les files d'attente d'impression, et les caches.  