set backspace=indent,eol,start

filetype plugin on

syntax on

call plug#begin()

Plug 'romainl/flattened'
Plug 'arcticicestudio/nord-vim'

call plug#end()

set background=dark
colorscheme flattened_dark
if $SSH_CONNECTION
	colorscheme nord
endif
