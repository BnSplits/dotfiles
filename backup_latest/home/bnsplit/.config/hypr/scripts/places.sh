#!/bin/bash

# Répertoires source et destination
SRC_BASE="/home/bnsplit/Music/papirus-icon-theme-teal-folders/Papirus"
DST_BASE="/home/bnsplit/.icons/Papirus"

# Vérifie si les répertoires existent
if [[ ! -d "$SRC_BASE" || ! -d "$DST_BASE" ]]; then
    echo "Le répertoire source ou destination n'existe pas."
    exit 1
fi

# Parcourt tous les dossiers dans le répertoire source
for src_dir in "$SRC_BASE"/*; do
    # Vérifie si c'est un dossier
    if [[ -d "$src_dir" ]]; then
        # Nom du sous-dossier
        folder_name=$(basename "$src_dir")

        # Chemin du dossier de destination
        dst_dir="$DST_BASE/$folder_name"

        # Vérifie si le dossier de destination existe
        if [[ -d "$dst_dir" ]]; then
            # Supprime l'ancien dossier "places" dans la destination
            rm -rf "$dst_dir/places"
            
            # Copie le nouveau dossier "places"
            cp -r "$src_dir/places" "$dst_dir/"
            echo "Dossier 'places' mis à jour pour : $folder_name"
        else
            echo "Le dossier destination $folder_name n'existe pas dans $DST_BASE."
        fi
    fi
done

echo "Mise à jour terminée."
