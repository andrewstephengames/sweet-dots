#
# andrewstephengames's ~/.bashrc
#    _              _                    ____  _             _                
#   / \   _ __   __| |_ __ _____      __/ ___|| |_ ___ _ __ | |__   ___ _ __  
#  / _ \ | '_ \ / _` | '__/ _ \ \ /\ / /\___ \| __/ _ \ '_ \| '_ \ / _ \ '_ \ 
# / ___ \| | | | (_| | | |  __/\ V  V /  ___) | ||  __/ |_) | | | |  __/ | | |
#/_/   \_\_| |_|\__,_|_|  \___| \_/\_/  |____/ \__\___| .__/|_| |_|\___|_| |_|
#                                                     |_|                     
#                                 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=vim
export VISUAL=vim
alias clock='tty-clock -xcC2'
alias ls='ls --color=auto'
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
alias mus='~/scripts/shell/mus'
alias cpu='~/scripts/shell/cpu'
alias dotsync='~/scripts/shell/dotsync'
# alias mem='[free -h | head -n 2 | awk 'print $6}' | tail -n 1]'
alias mpv='mpv --force-seekable=yes'
alias mpa='mpv --force-seekable=yes --vo=null'
alias mp1440='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?1440]+bestaudio[ext=m4a]"'
alias mp1080='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]"'
alias mp720='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a]"'
alias mp480='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?480]+bestaudio[ext=m4a]"'
alias mpvtty='mpv --force-seekable=yes --no-audio-display'
set -o vi
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#export PS1="\W $(tput setaf 7)\\\$ "

$HOME/scripts/shell/autocowsay
#$HOME/scripts/shell/ri
source /usr/share/doc/pkgfile/command-not-found.bash

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi
