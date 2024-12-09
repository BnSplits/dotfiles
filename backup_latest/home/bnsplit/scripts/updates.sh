#!/bin/bash

# Afficher les mises à jour disponibles
sudo echo
clear
echo "---------------------------------------------------------------------------------"
yay -Qu
echo "---------------------------------------------------------------------------------"

# Demander confirmation avant de lancer la mise à jour
read -p "Souhaitez-vous lancer la mise à jour ? (y/n) : " confirm

if [[ $confirm == "y" || $confirm == "Y" || $confirm == "" ]]; then
    echo "Lancement de la mise à jour..."
    yay -Su --quiet --noconfirm
else
    echo "Mise à jour annulée."
fi
