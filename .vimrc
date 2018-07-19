set nocompatible                "be iMproved, required
filetype off                    "required
"==============================================================================
" Vundle settings
"==============================================================================
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'lambdalisue/vim-pyenv', {
        \ 'depends': ['davidhalter/jedi-vim'],
        \ 'autoload': {
        \   'filetypes': ['python', 'python3'],
        \ }}
Plug 'neomake/neomake'
Plug 'jiangmiao/auto-pairs'

call plug#end()
filetype on
"==============================================================================
" General settings
"==============================================================================
let g:mapleader = ","
"==============================================================================
" Vim-airline settings
"==============================================================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
"==============================================================================
" Deoplete settings
"==============================================================================
let g:deoplete#enable_at_startup = 1
"==============================================================================
" NERDTree settings
"==============================================================================
" Leader+n to toggle NERDTree
map <Leader>n :NERDTreeToggle<CR>
" close vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set background=dark
colorscheme bubblegum-256-dark
"colorscheme atom-dark-256
"colorscheme breezy

set backspace=indent,eol,start

set colorcolumn=80
set cursorline

set ruler
set ttyfast

set expandtab
set tabstop=2
set shiftwidth=2
set sts=2

autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=4 sw=4 sts=4 expandtab

set autoindent
set smartindent

set ttimeoutlen=0

set scrolloff=5
set hlsearch
set relativenumber
set number

set encoding=utf-8
set fileencoding=utf-8

set list
set listchars=tab:>-,trail:·
hi SpecialKey ctermfg=7 guifg=gray

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

syntax on

set mouse=a
set nowrap
