#!/bin/sh

ckb-next -c && ckb-next -b &

clipmenud &

kiwix-serve --port=8080 $XDG_DOCUMENTS_DIR/wikipedia/wikipedia_en_all_mini_*.zim --daemon
kiwix-serve --port=8008 $XDG_DOCUMENTS_DIR/wikipedia/wikipedia_en_all_maxi_*.zim --daemon

~/.fehbg &

numlockx on

slstatus &

xrandr --output DVI-D-0 --mode 1920x1080 --rate 144 
xrandr --output HDMI-A-0 --right-of DVI-D-0 --mode 1920x1080 --rate 144
xrandr --output DP4 --mode 1920x1080 --rate 144

sct 5000 &

xcompmgr -c -l0 -t0 -r0 -o.00 &

xhost si:localuser:root >/dev/null

while true; do
	dwm 2> ~/.dwm.log
done
