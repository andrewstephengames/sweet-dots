#
# andrewstephengames's ~/.bashrc
#    _              _                    ____  _             _                
#   / \   _ __   __| |_ __ _____      __/ ___|| |_ ___ _ __ | |__   ___ _ __  
#  / _ \ | '_ \ / _` | '__/ _ \ \ /\ / /\___ \| __/ _ \ '_ \| '_ \ / _ \ '_ \ 
# / ___ \| | | | (_| | | |  __/\ V  V /  ___) | ||  __/ |_) | | | |  __/ | | |
#/_/   \_\_| |_|\__,_|_|  \___| \_/\_/  |____/ \__\___| .__/|_| |_|\___|_| |_|
#                                                     |_|                     
# Useful exports
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=vim
export VISUAL=vim
set -o vi
source $HOME/.profile

# If running under a tty, double the size of the text
#[[ $XDG_SESSION_TYPE = "tty" ]] && setfont -d

# If the .trash/ directory doesn't exist, create it
[[ -z ~/.trash ]] && mkdir ~/.trash

# Show effective user in prompts and terminal titles
#USER=`id -un`

# Make a nice prompt
[ "${EUID}" = "0" ] && export PS1="\[\033[1;32;40m\]\h\[\033[0;37;40m\]:\[\033[34;40m\][\[\033[1;31;40m\]\u\[\033[0;34;40m\]]\[\033[0;37;40m\]:\[\033[35;40m\]\w\[\033[1;33;40m\]#\[\033[0m\] " \
                    || export PS1="\[\033[1;32;40m\]\h\[\033[0;37;40m\]:\[\033[31;40m\][\[\033[1;34;40m\]\u\[\033[0;31;40m\]]\[\033[0;37;40m\]:\[\033[35;40m\]\w\[\033[1;33;40m\]$\[\033[0m\] "
export PS2='$(tput setaf 2)> '

# Source .bash_aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Bash completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
