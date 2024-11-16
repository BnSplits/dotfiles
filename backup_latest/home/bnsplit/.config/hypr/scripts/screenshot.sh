#!/bin/bash

# Définir le dossier de destination
screenshot_dir="$HOME/Images/Screenshots"

# Créer le dossier s'il n'existe pas
mkdir -p "$screenshot_dir"

# Générer le nom de fichier avec la date et l'heure actuelles
filename="$(date +'%Y-%m-%d_%Hh%Mm%Ss').png"

# Chemin complet du fichier
filepath="$screenshot_dir/$filename"

# Vérifier l'option passée en argument
if [ "$1" == "part" ]; then
    # Capture partielle avec grim et slurp
    grim -g "$(slurp)" "$filepath"
elif [ "$1" == "full" ]; then
    # Capture plein écran
    grim "$filepath"
else
    echo "Invalid option. Use 'part' for partial capture or 'full' for full screen."
    exit 1
fi

# Vérifier si grim a réussi
if [ $? -eq 0 ]; then
    # Appliquer une bordure de 1x1 avec ImageMagick (magick)
    magick "$filepath" -shave 1x1 PNG:- | wl-copy

    # Vérifier si magick a réussi
    if [ $? -eq 0 ]; then
        # Envoyer une notification de succès
            "hyprshot"
        notify-send "Screenshot" "<i>Saved and copied to clipboard :<b>  $filepath</b></i>" -i "$filepath"  -t "5000"
    else
        notify-send "Screenshot" "Failed to copy to clipboard"  -t "5000"
    fi
else
    notify-send "Screenshot" "Capture failed" -t "5000"
fi
