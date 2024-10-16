#!/bin/bash

# Dossier contenant les fonds d'écran
WALLPAPER_DIR=~/Images/Wallpapers

# Lancer Feh pour choisir un fond d'écran avec une taille de fenêtre définie
SELECTED_WALLPAPER=$(feh --no-fehbg --cache-size 2048 --thumbnails  --thumb-width 400 --geometry 800x600 --recursive --action "echo %f" "$WALLPAPER_DIR")

# Vérifier si une image a été sélectionnée
if [ -n "$SELECTED_WALLPAPER" ]; then
    # Appliquer le fond d'écran avec swww et un effet de transition
    swww img "$SELECTED_WALLPAPER" --transition-type any
    notify-send "Fond d'écran changé avec succès à : $SELECTED_WALLPAPER"
else
    notify-send "Aucun fond d'écran sélectionné."
fi

