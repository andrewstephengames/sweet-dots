#!/bin/sh
picom &
#appimagelauncherd &
sh $HOME/scripts/dotsync
sh $HOME/scripts/pkgmaintain.sh
lxsession &
dunst &
redshift &
unclutter --timeout 3 &
nitrogen --restore &
flameshot &
pcmanfm -d &
kdeconnect-indicator &
xset -dpms &
xset s off &
xset -b &
#brave &
