#!/bin/bash

# always reload first 
DISPLAY=:0 sudo -u smowky autorandr --change --default ntb

# wait till profile reloads
sleep 1

unset $current_profile
# get current profile name


current_profile=$(DISPLAY=:0 sudo -u smowky autorandr --current)
echo "Current profile is: $current_profile"
# get user home 

home='/home/smowky'
echo "home is ${home}"

if [ "$current_profile" = "ntb" ]; then
        rm ${home}/.config/i3/config-enabled/* 
        ln -s ${home}/.config/i3/config-available/ntb ${home}/.config/i3/config-enabled/ntb 
        DISPLAY=:0 sudo -u smowky        i3 restart 
        DISPLAY=:0 sudo -u smowky        ${home}/.config/polybar/cuts/launch-ntb.sh
	DISPLAY=:0 sudo -u smowky        ${home}/.config/i3/config :notify-send "Reloaded i3 :)"
elif [ "$current_profile" = "benqL_benqR" ]; then
        rm ${home}/.config/i3/config-enabled/* 
        ln -s ${home}/.config/i3/config-available/benqL_benqR ${home}/.config/i3/config-enabled/benqL_benqR 
        DISPLAY=:0 sudo -u smowky        i3 restart 
        DISPLAY=:0 sudo -u smowky        ${home}/.config/polybar/cuts/launch-benqL_benqR.sh
	DISPLAY=:0 sudo -u smowky        ${home}/.config/i3/config :notify-send "Reloaded i3 :)"
elif [ "$current_profile" = "ntb+benqLR" ]; then 
        rm ${home}/.config/i3/config-enabled/* 
        ln -s ${home}/.config/i3/config-available/ntb+benqLR ${home}/.config/i3/config-enabled/ntb+benqLR
        DISPLAY=:0 sudo -u smowky        i3 restart 
        DISPLAY=:0 sudo -u smowky        ${home}/.config/polybar/cuts/launch-ntb+benqLR.sh
	DISPLAY=:0 sudo -u smowky        ${home}/.config/i3/config :notify-send "Reloaded i3 :)"
elif [ "$current_profile" = "kancl" ]; then 
        rm ${home}/.config/i3/config-enabled/* 
        ln -s ${home}/.config/i3/config-available/kancl ${home}/.config/i3/config-enabled/kancl
        DISPLAY=:0 sudo -u smowky        i3 restart 
        DISPLAY=:0 sudo -u smowky        ${home}/.config/polybar/cuts/launch-kancl.sh
	DISPLAY=:0 sudo -u smowky        ${home}/.config/i3/config :notify-send "Reloaded i3 :)"
fi

# change i3 config with `i3-msg restart`
