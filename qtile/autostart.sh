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
#unclutter --timeout 3 &
#feh --bg-fill wallpapers/0033.jpg &
#nitrogen --restore &
sh $HOME/git/scripts/randbg &
#(cd $HOME/wallpapers/) &&
#(wall=$(ls *.jpg | sort -R | head -n1)) &&
#(notify-send "$(echo $wall)") &&
#([[ $XDG_SESSION_TYPE = "x11" ]] && feh --bg-fill "$wall") &&
#([[ $XDG_SESSION_TYPE = "wayland" ]] && swaybg -i "$wall" -m fill) &
cd $HOME &
/usr/lib/kdeconnectd &
kdeconnect-indicator &
flameshot &
nextcloud &
mpvc &
pcmanfm &
#mconnect -d &
#dolphin &
git/scripts/librewolf &
qterminal &
lxterminal -e $HOME/git/scripts/mus &
#lutris &
pavucontrol &
nsxiv -s f -b $HOME/Documents/timetable-darkmode.png &
ultimmc &
#(sleep 10 && wmctrl -s 0 && wmctrl -s 1 && wmctrl -s 2 && wmctrl -s 3 && wmctrl -s 4 && wmctrl -s 5 &&
#wmctrl -s 6 && wmctrl -s 7 && wmctrl -s 8 && wmctrl -s 0) &
#cool-retro-term -e $HOME/scripts/mus &
#newsflash &
