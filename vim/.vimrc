call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Initialize plugin system
call plug#end()

let g:molokai_original = 1
:colorscheme molokai
:syntax on
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set number
set relativenumber 
