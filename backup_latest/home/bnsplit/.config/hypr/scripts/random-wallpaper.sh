#!/bin/bash

# Chemin vers le dossier contenant les fonds d'écran
WALLPAPER_DIR="/home/bnsplit/Images/Wallpapers"
CACHE_DIR="$HOME/.cache"
CACHE_FILE="$CACHE_DIR/random_wallpaper"

# Vérifier si swww est installé
if ! command -v swww &> /dev/null; then
    echo "Erreur : 'swww' n'est pas installé. Installez-le d'abord."
    exit 1
fi

# Vérifier si le dossier existe
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Erreur : Le dossier $WALLPAPER_DIR n'existe pas."
    exit 1
fi

# Vérifier si le répertoire .cache existe, sinon le créer
if [ ! -d "$CACHE_DIR" ]; then
    mkdir -p "$CACHE_DIR"
fi

# Supprimer tout fichier existant nommé random_wallpaper (sans extension) dans le cache
rm -f "$CACHE_FILE"

# Rechercher tous les fichiers d'images dans le dossier et les sous-dossiers
wallpapers=($(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \)))

# Vérifier s'il y a des fichiers d'image
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "Erreur : Aucun fichier d'image trouvé dans $WALLPAPER_DIR."
    exit 1
fi

# Sélectionner un fond d'écran aléatoire
RANDOM_WALLPAPER="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Copier le fond d'écran dans ~/.cache sous le nom random_wallpaper (sans extension)
cp "$RANDOM_WALLPAPER" "$CACHE_FILE"

# Appliquer le fond d'écran avec une transition aléatoire
swww img "$CACHE_FILE" --transition-type any
echo "Fond d'écran changé pour : $CACHE_FILE"

