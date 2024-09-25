#!/usr/bin/env bash
# File              : autostart.sh
# Date              : 18.04.2023
# Last Modified Date: 18.04.2023

# X settings
xset -dpms
xset r rate 300 50

nitrogen --restore &>/dev/null

# prepare screenlocker
light-locker & disown
flameshot & disown
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 & disown
