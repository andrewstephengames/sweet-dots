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
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
