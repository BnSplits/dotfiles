#!/bin/bash
# Databases syncing
# echo " " &&
# echo "Databases sync..." &&
# echo " " &&
# yay -Sy > /dev/null 2>&1 &&
# echo " " &&

# Affiche les mises à jour disponibles
# echo " " &&
# echo "Updates available..." &&
# echo " " &&
# yay -Qu &&

echo " " &&
echo "Installing updates..." &&

# Exécute la mise à jour avec yay, en utilisant sudo pour éviter la demande de mot de passe
yay -Syu --noconfirm
