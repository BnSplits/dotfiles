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
        # Nouveau nom sans extension
        nouveau_nom="${fichier%.*}"
        mv "$fichier" "$nouveau_nom"
        echo "Renommé : $fichier -> $nouveau_nom"
    fi
done

echo "Opération terminée."
