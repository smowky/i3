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
export PRIMARY_MONITOR=$(xrandr --query | grep " connected primary" | cut -d" " -f1)
export SECONDARY_MONITOR_1=$(xrandr --query | grep " connected" | grep -v " primary" | cut -d" " -f1 | head -n 1 | tail -1)
export SECONDARY_MONITOR_2=$(xrandr --query | grep " connected" | grep -v " primary" | cut -d" " -f1 | head -n 2 | tail -1)


# Launch the bar
polybar -q top2 -c "$DIR"/config.ini &
if [ -v SECONDARY_MONITOR_1 ]; then polybar -q top3 -c "$DIR"/config.ini & fi
if [ -v SECONDARY_MONITOR_2 ]; then polybar -q top4 -c "$DIR"/config.ini & fi
polybar -q bottom -c "$DIR"/config.ini &
