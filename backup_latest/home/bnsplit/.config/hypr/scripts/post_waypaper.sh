#!/bin/bash

# Exécuter le script de génération des couleurs
~/.config/hypr/scripts/colors_generator.sh "$1" &&
echo "Couleurs générées avec succès."

# Terminer les processus swaync et waybar
killall waybar &&
echo "swaync et waybar ont été arrêtés."

# Relancer swaync en arrière-plan
swaync-client -R && 
swaync-client -rs && 
echo "swaync relancé."

# Relancer waybar en arrière-plan
waybar &
echo "waybar relancé."

# Flouter l'image de fond et attendre que la tâche soit terminée
magick ~/.cache/wallpaper -blur 0x20 ~/.cache/wallpaper-blur && echo "Fond d'écran flouté."

# Attendre que les tâches en arrière-plan se terminent
wait

# Afficher un message de fin
echo "Script exécuté avec succès."
