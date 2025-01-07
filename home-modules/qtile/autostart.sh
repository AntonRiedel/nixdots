#!/usr/bin/env bash

xset -dpms
xset s off
xset r rate 300 50
#
# light-locker &
flameshot &
blueman-applet &
keepassxc &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
