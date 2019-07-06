set nocompatible                "be iMproved, required
filetype off                    "required
"==============================================================================
" vim plug settings
"==============================================================================
call plug#begin('~/.vim/bundle')

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'machakann/vim-sandwich'

" git
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'

" navigation
Plug 'liuchengxu/vista.vim'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'exu/pgsql.vim'

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

" clojure
" TODO: cider-jackin and deoplete completion
Plug 'clojure-vim/async-clj-omni'

" terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'w0rp/ale'

" navigation
Plug 'liuchengxu/vista.vim'

Plug 'junegunn/vim-easy-align'

call plug#end()
filetype on

"==============================================================================
" lightline settings
"==============================================================================
let g:lightline = {}
let g:lightline.colorscheme = "one"
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
set showtabline=2

"==============================================================================
" deoplete settings
"==============================================================================
let g:python_host_prog = '/home/dmitry/.pyenv/versions/2.7/bin/python'
let g:python3_host_prog = '/home/dmitry/.pyenv/versions/3.6.8/bin/python'

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
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

" terraform
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

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
" vista settings
"==============================================================================
nnoremap <Leader>t :Vista!!<CR>

"==============================================================================
" closetag settings
"==============================================================================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tpl'

"==============================================================================
" terraform settings
"==============================================================================
let g:terraform_align = 1
let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save = 1
"==============================================================================
" easy-align settings
"==============================================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==============================================================================
" general settings
"==============================================================================
set background=dark
syntax on
colorscheme afterglow

" gitgutter colors
highlight clear SignColumn
highlight GitGutterAdd          ctermfg=green
highlight GitGutterChange       ctermfg=yellow
highlight GitGutterDelete       ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

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

set mouse=a
set nowrap

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set grepprg=grep\ -n\ $*
