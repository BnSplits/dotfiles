#!/bin/bash
# Wallpaper cached
cp $1 ~/.cache/wallpaper

# Blur cached wallpaper
magick ~/.cache/wallpaper -blur 0x15 ~/.cache/wallpaper-blur

# Apply color scheme
wal -i $1

# Generate hypr colors
source_file="/home/bnsplit/.cache/wal/colors"
destination_file="/home/bnsplit/.config/hypr/global/colors.conf"
> "$destination_file"
i=1
while IFS= read -r line; do
    # Ecrire la ligne formatée dans le fichier de destination
    #echo "\$color$i = $line" >> "$destination_file"
    #((i++))
    
     # Supprimer le caractère # au début de chaque couleur
    clean_line="${line#\#}FF"
    echo "\$color$i = $clean_line" >> "$destination_file"
    ((i++))
done < "$source_file"

