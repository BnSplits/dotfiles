# Cours
[[Windows 10.pdf]]
[[Word 2013_01.pdf]]
[[Excel 2013.pdf]]
[[PowerPoint 2013.pdf]]
# Windows

- **Fenêtre Windows**
	- Les boutons au dessus de la fenêtre sont les boutons de contrôle et de gestion


- **Composants du bureau**
	- Les icônes
	- La barre des taches
	- Le papier peint


- **Menu contextuel**
	- C'est le menu dont le contenu dépend de l'objet sélectionné
	- Il est obtenu en cliquant sur le bouton droit de la souris


- **Ms. DOS**
	- Ancêtre de Windows sans interface graphique mais uniquement en ligne de commande


- **Barre de titre**
	- A gauche de la barre de titre se trouve **la barre d'outils Accès rapide**


- **La barre d'outils Accès rapide**
	- Elle permet d'afficher les commandes fréquemment utilisées
	- En dessous se trouve la barre d''onglet dont l'onglet fichier est un menu et non pas un onglet. Les autres affichent un ruban

- L' explorateur de fichiers est un gestionnaire de fichiers
- Le volet gauche du gestionnaire affiche l'arboréssance des fichiers/dossiers

- **Notion de dossier** : c'est encore la subdivision ou allocation créée sur le disque dans laquelle sont stockés les fichiers


# Word
- **Public Postage**: C'est une option de Word qui nous permet de produire en un temps record plusieurs documents. Pour le faire on doit avoir à sa portée deux types de documents : 
	- La source de donnée
	
	- Le texte type (qui sert un peu de base/model)

- 'La page' est appelée **zone de saisie**
- Tout en bas se trouve **la barre d'état**
	- **La barre d'état** : elle nous fournit des informations relatives au document courant

- **La frappe au kilomètre** : c'est le retour à la ligne automatique du curseur lors de la saisie du texte une fois arrivé à la fin de la ligne.

- **Lanceur de boite de dialogue** : c'est la petite flèche sous chaque groupe du ruban (exemples de groupes : police, paragraphe, style,...)

- Sélectionner, c'est établir une zone de surbrillance sur du texte.

- Un double click sur un mot le sélectionne
- Un triple click sur un paragraphe le sélectionne
- CTRL + click sélectionne une phrase
- Un click sur la marge gauche sélectionne la ligne a la hauteur du curseur

- **La table des matières** prend en compte tous les petits détails

- **Le sommaire** prend en  compte seulement les grand titres

- **Un saut de section** sert a ce que la mise en page d'une section n'affecte pas les autres sections

# Excel
- A B C D E … sont des entêtes  de colonnes 
- 1 2 3 4 5 … sont des  entêtes de lignes

- Le dernier entête de colonne est **XFD**
- Il y a **1 048 576 lignes**

- L'intersection d'une ligne et d'une colonne est **Une cellule**
- Une cellule est dite active lorsqu'elle est entourée du sélecteur

-  Sous le ruban on a :
	- La barre nom de la cellule (tout a gauche)
	- La barre des formules (tout a droite et grande)

- **" Ctrl + Home "**  renvoie à la cellule **A1**

- Les opérateurs arithmétiques :
	-   +   -   *   /   %   ^
- Les opérateurs de comparaison :
	-   =   >   >=   <   <=   <>
- L'opérateur de texte : **&** : sert à lier des chaînes de caractères; a faire de la concaténation de deux cellules

- Les références de cellules :
	- Les références absolus (Ex : $A$1, $B$6, $H$4,...) : 
	- Les références relatives (Ex : A1, B6, H4,...) : elles ont deux formes de références Mixte (Ex : A$1, H$6,...)
	- En gros le " $ " sert a verrouiller soit les colonnes ou soit les lignes (ca sert lors de réplication d'opération)(EX : $A1 = La colonne A est verrouillée; A$15 = La ligne 15 est verrouillée) (Verrouillée veut dire que pour reproduire une opération ca va reprendre l'opération pour chaque ligne/colonne non verrouillée)

- **La fonction "SI"**  qui permet de faire faire des test….
- Il est possible d'imbriquer des SI dans d'autres SI
	- Exemple : _=SI(F2>=10;"Admis";SI(F2>=8;"Passable";"Echoué"))_
- Quant on parle de **compris entre (contexte des SI)**, il faut utiliser le **>=**
- **Ctrl + "** : pour afficher les formules directement dans le tableau
- Les opérateurs logique : **ET ; OU** 
	- **Syntaxe d'exemple de OU** : _=SI(ET(F3>=10;B3>=10);"Admis"; SI(F3>=8;"Echoué";"Exclu"))_
	- **Syntaxe d'exemple de OU** : _=SI(OU(F3>=10;B3>=10);"Admis"; SI(F3>=8;"Echoué";"Exclu"))_
- **Quelques fonctions texte** :
	- **Sélectionner les éléments a partir de la gauche**
	- **Sélectionner les éléments a partir de la droite**
		- Exemple : _=GAUCHE(A2;2)&DROITE(B2;2)&C2&GAUCHE(E2;3)_

- [ ] Do something 📅 2024-12-15 