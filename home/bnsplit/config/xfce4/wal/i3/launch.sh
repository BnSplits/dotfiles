#!/bin/bash

# Check if HDMI-1 is connected
if xrandr | grep "HDMI-1 connected" > /dev/null; then
    # HDMI-1 is connected, set up screens
    xrandr --output eDP-1 --primary --mode 1366x768 --pos 1680x282 \
           --output HDMI-1 --mode 1680x1050 --pos 0x0
else
    # HDMI-1 is not connected, set up only eDP-1
    xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0
fi

# Restore background
#source ~/.fehbg && wal -R
wal -R

# Check if polybar is already running
if pgrep -x "polybar" > /dev/null; then
    # Kill all instances of polybar and restart it
    killall polybar
    polybar &
else
    # Start polybar if it's not running
    polybar &
fi
