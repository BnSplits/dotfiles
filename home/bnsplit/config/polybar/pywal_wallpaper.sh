#!/bin/bash

# Chemin du dossier contenant les images
WALLPAPER_DIR="$HOME/Images/Wallpapers"

# Sélectionner une image aléatoire
IMAGE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Exécuter la commande wal avec l'image sélectionnée
wal -i "$IMAGE"
