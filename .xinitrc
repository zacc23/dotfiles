#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

ckb-next -b &

clipmenud &

feh --bg-scale /usr/share/wallpapers/Cluster/contents/images/3840x2160.png

numlockx on

slstatus &

syncthing -no-browser -logflags=0 &

xrandr --output DVI-D-0 --mode 1920x1080 --rate 144
xrandr --output DVI-D-1 --mode 1920x1080 --rate 144
xrandr --output DP-2 --mode 1920x1080 --rate 144

exec dwm
