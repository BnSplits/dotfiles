#!/bin/bash

filepath="$HOME/.icons/Papirus/64x64/apps/sleep.svg"
# Vérifier si hypridle est en cours d'exécution
if pgrep -x "hypridle" > /dev/null
then
    # Si hypridle est en cours d'exécution, le tuer
    pkill -x "hypridle"
    notify-send "Inhibitor ON ! " "<i><b> </b></i>" -i "$filepath"  -t "5000"
else
    # Sinon, lancer hypridle
    hypridle &
    notify-send "Inhibitor OFF ! " "<i><b> </b></i>" -i "$filepath"  -t "5000"
fi
