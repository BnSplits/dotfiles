#!/bin/bash

# Fichier cible pour Hyprland configuration
hyprland_file="$HOME/.config/hypr/global/batterySave.conf"

# Fichier cible pour Waypaper configuration
waypaper_file="$HOME/.config/waypaper/config.ini"

# Fonction pour régler la luminosité
set_brightness() {
    brightness_value=$1
    # Remplace par la commande qui règle la luminosité de ton écran
    brightnessctl set "$brightness_value%"
}

# Fonction pour changer le backend dans le fichier waypaper
set_backend() {
    backend_value=$1
    # Remplacer le backend dans le fichier config.ini
    sed -i "s/^backend = .*/backend = $backend_value/" "$waypaper_file"
}

# Vérifier si le fichier hyprland contient "decoration:blur:enabled = false"
if grep -q "decoration:blur:enabled = false" "$hyprland_file"; then
    # Remplacer par "true"
    sed -i 's/decoration:blur:enabled = false/decoration:blur:enabled = true/' "$hyprland_file"
    echo "Toggled to true"
    # Mettre la luminosité à 90%
    set_brightness 90
    # Modifier le backend à swww
    set_backend swww
    # Notification
    notify-send "Power" "<b><i>Save mode deactivated ! </i></b>" -i "$HOME/.icons/Papirus/64x64/apps/utilities-energy-monitor.svg" -t "5000"
elif grep -q "decoration:blur:enabled = true" "$hyprland_file"; then
    # Remplacer par "false"
    sed -i 's/decoration:blur:enabled = true/decoration:blur:enabled = false/' "$hyprland_file"
    echo "Toggled to false"
    # Mettre la luminosité à 20%
    set_brightness 20
    # Modifier le backend à hyprpaper
    set_backend hyprpaper
    # Assure que hypridle est activé
    hypridle &
    # Notification
    notify-send "Power" "<b><i>Save mode activated ! </i></b>" -i "$HOME/.icons/Papirus/64x64/apps/utilities-energy-monitor.svg" -t "5000"
else
    echo "No decoration:blur:enabled line found"
fi
