#!/bin/sh
xset -dpms &
xset s off &
xset -b &
picom &
sh $HOME/git/scripts/dotsync &
sh $HOME/git/scripts/pkgmaintain &
sh $HOME/git/scripts/randbg &
dunst &
redshift &
/usr/lib/kdeconnectd &
while true; do dwm -s "$(date)"; sleep 1; done &
