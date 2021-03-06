alias ls='ls --color=auto'
alias c='clear'
alias d='cd "$(ls -d */ | fzf)"; clear; exa --all --long --header --sort=modified'
alias datedir='mkdir "$(date +%Y%m%d)"'
alias kooha='GST_VAAPI_ALL_DRIVERS=1 KOOHA_VAAPI=1 kooha'
alias grep='grep --color=auto'
alias mcon='/usr/local/bin/mconnect -d'
alias ll='exa --all --long --header --sort=modified'
alias cll='clear && exa --all --long --header --sort=modified'
alias cls='clear; ls --color=auto'
alias cdcl='cd ; clear'
alias cfetch='clear ; neofetch'
alias lld='ls -d */'
alias llb='exa --all --long --header --sort=modified | bat'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias ga='git add'
alias httptossh='git remote set-url origin'
alias rm='sh $HOME/scripts/mvtrash'
alias cp='cp -iv'
alias mv='mv -iv'
#alias yay='paru'
alias technoblade='doas pacman -Rs $(pacman -Qtdq)'
alias scr='sxiv ~/Screenshots'
alias wall='sxiv ~/wallpapers'
alias phone='cd /run/user/1000/a2f66128170a1390/'
alias path='pwd | zenity --text-info --width=300 --height=130'
alias clock='tty-clock -c'
alias sxiv='nsxiv -a'
#alias speed='speedtest-cli --simple --secure --bytes | sed 's/byte/B/''
alias droidfix='systemctl restart waydroid-container'
alias cmatrix='cmatrix -a'
#alias scrcpy='adb connect 192.168.0.178 && scrcpy'
alias mem='free -h'
alias mpv='mpv --force-seekable=yes'
alias mpa='mpv --force-seekable=yes --vo=null'
alias mp1440='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?1440]+bestaudio[ext=m4a]"'
alias mp1080='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]"'
alias mp720='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a]"'
alias mp480='mpv --force-seekable=yes --ytdl-format="bestvideo[ext=mp4][height<=?480]+bestaudio[ext=m4a]"'
alias mpvtty='mpv --force-seekable=yes --no-audio-display'
alias temp='inxi -s'
alias tmpvar='XDG_SESSION_TYPE=wayland dbus-run-session startplasma-wayland'
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias logout='pkill "$USER_WM"'
