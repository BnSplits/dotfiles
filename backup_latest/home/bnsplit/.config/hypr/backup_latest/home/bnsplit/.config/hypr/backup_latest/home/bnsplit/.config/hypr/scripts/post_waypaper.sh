#!/bin/bash
# Attend la fin d'animation de swww
sleep 2

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

# Flouter l'image de fond (si elle n'est pas un gif) et attendre que la tâche soit terminée
if [ -f ~/.cache/wallpaper ]; then
    # Récupère le type MIME du fichier
    file_type=$(file --mime-type -b ~/.cache/wallpaper)

    # Vérifie si le type MIME correspond à un GIF
    if [[ "$file_type" == "image/gif" ]]; then
        echo "Le fichier est un GIF, la commande ne sera pas exécutée."
    else
        magick ~/.cache/wallpaper -blur 0x20 ~/.cache/wallpaper-blur && echo "Fond d'écran flouté."
    fi
else
    echo "Le fichier ~/.cache/wallpaper n'existe pas."
fi

# Attendre que les tâches en arrière-plan se terminent
wait

# Afficher un message de fin
echo "Script exécuté avec succès."
