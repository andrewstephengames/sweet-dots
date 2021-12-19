#
# andrewstephengames's ~/.bashrc
#    _              _                    ____  _             _                
#   / \   _ __   __| |_ __ _____      __/ ___|| |_ ___ _ __ | |__   ___ _ __  
#  / _ \ | '_ \ / _` | '__/ _ \ \ /\ / /\___ \| __/ _ \ '_ \| '_ \ / _ \ '_ \ 
# / ___ \| | | | (_| | | |  __/\ V  V /  ___) | ||  __/ |_) | | | |  __/ | | |
#/_/   \_\_| |_|\__,_|_|  \___| \_/\_/  |____/ \__\___| .__/|_| |_|\___|_| |_|
#                                                     |_|                     
#                                 
ks=0

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
setfont -d || clear ; $HOME/scripts/shell/autocowsay; set ks=1
#if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#    exec sway
#fi
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=vim
export VISUAL=vim
alias clock='tty-clock -xcC2'
alias ls='ls --color=auto'
alias c='clear'
alias d='cd "$(ls -d */ | fzf)"; clear; exa --all --long --header --sort=modified'
alias datedir='mkdir "$(date +%Y%m%d)"'
alias grep='grep --color=auto'
alias ll='exa --all --long --header --sort=modified'
alias cll='clear && exa --all --long --header --sort=modified'
alias cdcl='cd ; clear'
alias lld='ls -d */'
alias llb='exa --all --long --header --sort=modified | bat'
alias gs='git status'
alias rm='sh /home/$USER/scripts/shell/mvtrash'
alias cp='cp -iv'
alias mv='mv -iv'
alias yay='paru'
alias scr='sxiv ~/Screenshots'
alias wall='sxiv ~/wallpapers'
alias phone='cd /run/user/1000/a2f66128170a1390/'
alias path='pwd | zenity --text-info --width=300 --height=130'
alias speed='speedtest-cli --simple --secure --bytes | sed 's/byte/B/''
alias droidfix='systemctl restart waydroid-container'
alias cmatrix='cmatrix -a'
alias scrcpy='adb connect 192.168.0.178 && scrcpy'
alias mus='~/scripts/shell/mus'
alias cpu='~/scripts/shell/cpu'
# alias mem='[free -h | head -n 2 | awk 'print $6}' | tail -n 1]'
alias mpv='mpv --force-seekable=yes'
alias mpa='mpv --force-seekable=yes --vo=null'
alias mp1440='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?1440]+bestaudio[ext=m4a]"'
alias mp1080='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]"'
alias mp720='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a]"'
alias mp480='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?480]+bestaudio[ext=m4a]"'
alias mpvtty='mpv --force-seekable=yes --no-audio-display'
set -o vi
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\D{%H:%M}\[$(tput setaf 4)\]\[$(tput setaf 5)\] \W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\D{%H:%M}\[$(tput setaf 5) \]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$  \[$(tput sgr0)\]"
export PS2='$(tput setaf 2)> '

[[ -z $ks ]] && $HOME/scripts/shell/autocowsay
#$HOME/scripts/shell/ri
source /usr/share/doc/pkgfile/command-not-found.bash
source $HOME/.profile

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi
