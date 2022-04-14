#!/bin/sh
xset -dpms &
xset s off &
xset -b &
picom &
sh $HOME/scripts/dotsync
sh $HOME/scripts/pkgmaintain
dunst &
redshift &
pulseaudio &
unclutter --timeout 3 &
#sh $HOME/scripts/randbg
feh --bg-fill /home/andrew/wallpapers/zo7q0cdgb5h81.jpg
flameshot &
mpvc &
pcmanfm &
mconnect -d &
#dolphin &
waterfox-g4 &
qterminal &
lxterminal -e $HOME/scripts/mus &
fsearch &
#lutris &
pavucontrol &
nsxiv -s f -b $HOME/Documents/timetable-darkmode.png &
ultimmc &
#(sleep 10 && wmctrl -s 0 && wmctrl -s 1 && wmctrl -s 2 && wmctrl -s 3 && wmctrl -s 4 && wmctrl -s 5 &&
#wmctrl -s 6 && wmctrl -s 7 && wmctrl -s 8 && wmctrl -s 0) &
#cool-retro-term -e $HOME/scripts/mus &
#newsflash &
