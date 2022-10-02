#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/cuts"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# clear env vars
unset PRIMARY_MONITOR
unset SECONDARY_MONITOR_1
unset SECONDARY_MONITOR_2

# set env vars
export PRIMARY_MONITOR=DP-1-2
export SECONDARY_MONITOR_1=DP-1-3
export SECONDARY_MONITOR_2=eDP-1


# Launch the bar
polybar -q top2 -c "$DIR"/config.ini &
polybar -q top3 -c "$DIR"/config.ini &
polybar -q top4 -c "$DIR"/config.ini &
polybar -q bottom -c "$DIR"/config.ini &
