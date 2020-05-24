#!/bin/sh

alsactl --file ~/.config/asound.state restore
amixer -D bluealsa sset "$BLUEALSA_DEV" 70%

ckb-next -b &

clipmenud &

btpd &

transmission-daemon &

kiwix-serve --port=8080 $XDG_DOCUMENTS_DIR/wikipedia/wikipedia_en_all_mini_*.zim --daemon
kiwix-serve --port=8008 $XDG_DOCUMENTS_DIR/wikipedia/wikipedia_en_all_maxi_*.zim --daemon

sfeed_update & >/dev/null

~/.fehbg &

numlockx on

slstatus &

syncthing -no-browser -logflags=0 &

xrandr --output DVI-D-0 --mode 1920x1080 --rate 144
xrandr --output DVI-D-1 --mode 1920x1080 --rate 144
xrandr --output DP-1 --mode 1920x1080 --rate 144
xrandr --output DP-2 --mode 1920x1080 --rate 144

sct 5000 &

xcompmgr -c -l0 -t0 -r0 -o.00 &

while true; do
	# Log stderror to a file 
	dwm 2> ~/.dwm.log
done
