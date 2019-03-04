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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" syntax
Plug 'sheerun/vim-polyglot'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" python
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'

" js
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'

" html/xml tags closing
Plug 'alvan/vim-closetag'

" c/c++
Plug 'tweekmonster/deoplete-clang2'

Plug 'w0rp/ale'

" navigation
Plug 'majutsushi/tagbar'

call plug#end()
filetype on

"==============================================================================
" Vim-airline settings
"==============================================================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

"==============================================================================
" deoplete settings
"==============================================================================
let g:python_host_prog = '/home/dmitry/.pyenv/shims/python2'
let g:python3_host_prog = '/home/dmitry/.pyenv/shims/python3'

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100
let g:deoplete#auto_refresh_delay = 30

" autoclose preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" jedi
let g:jedi#completions_enabled = 0

" tern completion
let g:deoplete#sources#ternjs#tern_bin = 'tern'
let g:deoplete#sources#ternjs#timeout = 0
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#in_literal = 0

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

"==============================================================================
" ale settings
"==============================================================================
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\   'javascript': ['eslint'],
\}

"==============================================================================
" NERDTree settings
"==============================================================================
let NERDTreeShowHidden = 1
" Leader+f to toggle NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>
" close vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"==============================================================================
" Tagbar settings
"==============================================================================
nnoremap <Leader>t :TagbarToggle<CR>

"==============================================================================
" Tagbar settings
"==============================================================================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tpl'
"==============================================================================
" general settings
"==============================================================================
set background=dark
colorscheme afterglow

set colorcolumn=80
set cursorline

set ruler
set ttyfast
set shell=zsh\ -l

" default
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent

set expandtab

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

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
