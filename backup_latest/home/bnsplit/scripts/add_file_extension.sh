#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
    echo "Usage: $0 <dossier>"
    exit 1
fi

# Répertoire cible
dossier="$1"

# Vérifie si le dossier existe
if [ ! -d "$dossier" ]; then
    echo "Erreur : le dossier '$dossier' n'existe pas."
    exit 1
fi

# Parcourt les fichiers du dossier
for fichier in "$dossier"/*; do
    if [ -f "$fichier" ]; then
        # Détecte le type réel du fichier
        type_fichier=$(file --mime-type -b "$fichier")
        
        # Déduit l'extension en fonction du type MIME
        case "$type_fichier" in
            text/plain) extension="txt" ;;
            image/jpeg) extension="jpg" ;;
            image/png) extension="png" ;;
            image/gif) extension="gif" ;;
            application/pdf) extension="pdf" ;;
            application/zip) extension="zip" ;;
            application/x-tar) extension="tar" ;;
            application/x-gzip) extension="gz" ;;
            video/mp4) extension="mp4" ;;
            audio/mpeg) extension="mp3" ;;
            *) extension="" ;; # Si le type n'est pas reconnu
        esac

        # Si une extension est détectée
        if [ -n "$extension" ]; then
            nouveau_nom="${fichier%.*}.$extension"
            mv "$fichier" "$nouveau_nom"
            echo "Renommé : $fichier -> $nouveau_nom"
        else
            echo "Type inconnu pour le fichier : $fichier"
        fi
    fi
done

echo "Analyse et renommage terminés."
