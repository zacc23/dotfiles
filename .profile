# environment variables
PATH="$PATH:/usr/lib/surfraw:$HOME/dotnet:$HOME/.local/bin:$(yarn global bin)"

eval `dircolors ~/.dir_colors`

export CC=/bin/tcc

export CLR_OPENSSL_VERSION_OVERRIDE=47

export DOTNET_ROOT=$HOME/dotnet

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export EDITOR='vim'

export GIT_PULL_DIR=$HOME/src

export _JAVA_AWT_WM_NONREPARENTING=1

export QT_QPA_PLATFORMTHEME=qt5ct

export REDDIO_LIB=$HOME/.local/share/reddio

export SAL_USE_VCLPLUGIN=gtk3

export SCREENSHOT_PATH=$HOME/Pictures/Screenshots

export XDG_CONFIG_HOME=$HOME/.config

# autostart X
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty2 ]]; then exec startx; fi

