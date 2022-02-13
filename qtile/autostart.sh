#!/bin/sh
xset -dpms &
xset s off &
xset -b &
picom &
xfce4-panel &
sh $HOME/scripts/dotsync
sh $HOME/scripts/pkgmaintain.sh
dunst &
redshift &
unclutter --timeout 3 &
$HOME/scripts/randbg
flameshot &
#pcmanfm -d &
/usr/lib/kdeconnectd -platform offscreen &
kdeconnect-indicator &
#dolphin &
waterfox-g4 &
pcmanfm &
wmctrl -s 2
alacritty &
lxterminal -e $HOME/scripts/mus &
lutris &
pavucontrol &
gpicview $HOME/Documents/timetable-darkmode.png &
transmission-gtk &
(sleep 10 && wmctrl -s 0 && wmctrl -s 1 && wmctrl -s 2 && wmctrl -s 3 && wmctrl -s 4 && wmctrl -s 5 &&
wmctrl -s 6 && wmctrl -s 7 && wmctrl -s 8 && wmctrl -s 0) &
#cool-retro-term -e $HOME/scripts/mus &
#newsflash &
