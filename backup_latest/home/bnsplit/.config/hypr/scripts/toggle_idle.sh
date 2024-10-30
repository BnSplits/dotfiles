#!/bin/bash

filepath="$HOME/.icons/Papirus/64x64/apps/sleep.svg"
# Vérifier si hypridle est en cours d'exécution
if pgrep -x "hypridle" > /dev/null
then
    # Si hypridle est en cours d'exécution, le tuer
    pkill -x "hypridle"
    echo "hypridle a été tué."
    notify-send "Hypridle is : " "<i><b> OFF ! </b></i>" -i "$filepath"  -t "5000"
else
    # Sinon, lancer hypridle
    hypridle &
    echo "hypridle a été lancé."
    notify-send "Hypridle is : " "<i><b> ON ! </b></i>" -i "$filepath"  -t "5000"
fi
