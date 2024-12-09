#!/bin/bash

# Vérifier si Waybar est en cours d'exécution
if pgrep -x "waybar" > /dev/null
then
    # Si Waybar est en cours d'exécution, le tuer
    pkill -x "waybar"
    echo "Waybar a été tué."
else
    # Sinon, lancer Waybar
    waybar &
    echo "Waybar a été lancé."
fi
