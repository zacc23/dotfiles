autoload -U colors && colors
PS1="%B[%{$fg[red]%}%n@%M %~%{$reset_color%}%B]%b$ "

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit && compinit
zstyle ':completion:*' menu select
setopt completealiases

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
