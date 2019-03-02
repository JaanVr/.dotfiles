call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'dylanaraps/wal.vim'
" Initialize plugin system
call plug#end()

colorscheme wal
"let g:molokai_original = 1
":colorscheme molokai
:syntax on
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set number
set relativenumber 
set incsearch
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='-'
set expandtab
set shiftwidth=3
set softtabstop=3
set winheight=30
set winminheight=5
autocmd VimEnter * NERDTree
