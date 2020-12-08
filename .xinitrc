#!/bin/sh

ckb-next -c && ckb-next -b &

clipmenud &

barrierc 192.168.0.10 
xdotool keyup BackSpace Shift_L Shift_R Control_L Control_R Alt_L Alt_R Super_L Super_R Hyper_L Hyper_R Caps_Lock 204 205 206 207

kiwix-serve --port=8080 $XDG_DOCUMENTS_DIR/wikipedia/wikipedia_en_all_mini_*.zim --daemon
kiwix-serve --port=8008 $XDG_DOCUMENTS_DIR/wikipedia/wikipedia_en_all_maxi_*.zim --daemon

numlockx on

slstatus &

xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group

xrandr --output DVI-D-0 --mode 1920x1080 --rate 144 
xrandr --output HDMI-A-0 --right-of DVI-D-0 --mode 1920x1080 --rate 144
xrandr --output DP4 --mode 1920x1080 --rate 144

~/.fehbg # setroot -z ~/pictures/wallpapers/mountainredplants.jpg --on 1 -z ~/pictures/wallpapers/bliss.png --on 2 

sct 5000 &

xcompmgr -cC -l0 -t0 -r0 & # picom -b

xhost si:localuser::root >/dev/null

while true; do
	dwm 2> ~/.dwm.log
done
