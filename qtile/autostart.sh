#!/bin/sh
xset -dpms &
xset s off &
xset -b &
picom &
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
waterfox-g4 &
#dolphin &
pcmanfm &
lxterminal &
qterminal -e $HOME/scripts/mus &
lutris &
pavucontrol &
gpicview $HOME/Documents/timetable-darkmode.png &
transmission-gtk &
xfce4-panel &
wmctrl -s 1
wmctrl -s 2
wmctrl -s 3
wmctrl -s 4
wmctrl -s 5
wmctrl -s 6
wmctrl -s 7
wmctrl -s 8
wmctrl -s 9
wmctrl -s 1
#cool-retro-term -e $HOME/scripts/mus &
#newsflash &
