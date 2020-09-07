if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
