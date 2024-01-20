#!/bin/sh
# from https://pastebin.com/raw/ZRrXLZ9w
source $HOME/.controller_config
# environment variables
PATH="$PATH:/usr/lib/surfraw:$HOME/dotnet:$HOME/bin:$HOME/.local/bin:$HOME/.node_modules/bin"
export APLAY=aplay
export AUDIODRIVER=alsa
export BLUEALSA_DEV='AirPods - A2DP'
export BROWSER=qutebrowser
export CLR_OPENSSL_VERSION_OVERRIDE=47
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
export DICTIONARY=en_US
export DOOMWADDIR=$HOME/games/doom
export DOTNET_ROOT=$HOME/dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
export EDITOR=vi
export SRC_DIR=$HOME/src
export GAME_DIR=$HOME/games
export GDK_CORE_DEVICE_EVENTS=1
export GOPATH=$HOME/.local
#export HISTFILE=$HOME/.mksh_history
export _JAVA_AWT_WM_NONREPARENTING=1
#export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;34m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export MANPATH="/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/lib/plan9/man"
export MOZ_PLUGIN_PATH=$HOME/plugins
export NVM_DIR="$HOME/.config/nvm"
#export npm_config_prefix=$HOME/.node_modules
export PAGER='less -F'
export PASS=tpm # pass compatible manager: pass, tpm, or spm
export PIPELIGHT_EMBED=0
export QSYS_ROOTDIR="/home/zacc/documents/vt/sem3/digital/quartus/quartus/sopc_builder/bin"
export QT_QPA_PLATFORMTHEME=qt5ct
export REDDIO_LIB=$HOME/.local/share/reddio
export SAL_USE_VCLPLUGIN=gen
export SCROT_PATH=$HOME/pictures/screenshots
export SDL_AUDIODRIVER=alsa
export SF2=/usr/share/soundfonts/FluidR3_GM.sf2
export SJ_DIR=$HOME/.xmpp
#export TZ=America/Los_Angeles # Arizona
export VID_DIR=$HOME/videos/tmp
export VIDEO_FORMAT=NTSC
export WINEDEBUG=fps
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"
export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_PUBLICSHARE_DIR="$HOME/public"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_VIDEOS_DIR="$HOME/videos"

# commands
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#transmission-daemon -i 10.64.71.41 -I fc00:bbbb:bbbb:bb01::1:4728 -w ~/p2p \
#	-e ~/.config/transmission-daemon/error.log

# based on https://docs.voidlinux.org/config/graphical-session/wayland.html / https://web.archive.org/web/20191224070950/https://wiki.voidlinux.org/Wayland#Setting_XDG_RUNTIME_DIR
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]
then
	if [ -f /proc/acpi/bbswitch ] && grep OFF /proc/acpi/bbswitch >/dev/null
		then exec startx 
	elif [ -f /proc/acpi/bbswitch ] && grep ON /proc/acpi/bbswitch >/dev/null
		then exec startx -- -config nvidia.conf
	else
		exec startx
	fi
fi  # autostart X, should be last

