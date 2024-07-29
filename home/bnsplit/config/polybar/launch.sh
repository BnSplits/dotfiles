#!/bin/bash

# Terminer les instances existantes de polybar
killall -q polybar

# Attendre que polybar soit complètement terminé
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Vérifier les moniteurs connectés
if xrandr | grep -q "^HDMI-1 connected"; then
    MONITOR=HDMI-1 polybar mybar &
else
    MONITOR=eDP-1 polybar mybar &
fi

