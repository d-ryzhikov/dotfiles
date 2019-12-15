set nocompatible                "be iMproved, required
filetype off                    "required
"==============================================================================
" vim plug settings
"==============================================================================
call plug#begin('~/.vim/bundle')

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'

" git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lambdalisue/gina.vim'

" navigation
Plug 'scrooloose/nerdtree'

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
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" ts
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', {'do': './install.sh', 'for': 'typescript' }

" html/xml tags closing
Plug 'alvan/vim-closetag'

" c/c++
Plug 'tweekmonster/deoplete-clang2', { 'for': [ 'c', 'c++' ] }

" clojure
Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" dart
Plug 'dart-lang/dart-vim-plugin'

" flutter
Plug 'thosakwe/vim-flutter'

" lsp
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'w0rp/ale'

" navigation
"Plug 'ludovicchabant/vim-gutentags' motherfucking piece of shit doesn't work
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-grepper'

Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/asyncrun.vim'

" php
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

call plug#end()
filetype on

"==============================================================================
" lightline settings
"==============================================================================
let g:lightline = {
            \   "colorscheme": "one",
            \   "active": {
            \       "left": [
            \           ["mode", "paste"],
            \           ["readonly", "filename", "modified", "gitbranch", "gutentags"],
            \       ]
            \   },
            \   "tabline": {
            \       "left": [["buffers"]],
            \       "right": [["close"]]
            \   },
            \   "component_function": {
            \       "gitbranch": "gina#component#repo#branch",
            \       "gutentags": "gutentags#statusline",
            \   },
            \   "component_expand": {
            \      "buffers": "lightline#bufferline#buffers"
            \   },
            \   "component_type": {
            \       "buffers": "tabsel"
            \   }
            \}
set showtabline=2

"==============================================================================
" deoplete settings
"==============================================================================
let g:python_host_prog = '/home/dmitry/.pyenv/versions/nvim2/bin/python'
let g:python3_host_prog = '/home/dmitry/.pyenv/versions/nvim3/bin/python'
let g:node_host_prog = '/home/dmitry/.nvm/versions/node/v10.16.3/bin/neovim-node-host'

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

" php
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

call deoplete#initialize()

"==============================================================================
" ale settings
"==============================================================================
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['isort', 'black'],
            \   'javascript': ['eslint'],
            \   'php': ['phpcbf'],
            \   'terraform': ['terraform'],
            \}
let g:ale_linters = {
            \   'python': ['black', 'pylama'],
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
" closetag settings
"==============================================================================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tpl'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

"==============================================================================
" easy-align settings
"==============================================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==============================================================================
" ag settings
"==============================================================================
let g:ag_prg="ag --nogroup --column"

"==============================================================================
" gutentags and ctrlp tag settings
"==============================================================================
let g:gutentags_ctags_tagfile="./.git/tags"
let g:gutentags_exclude_project_root = ["/usr/local", "/home/dmitry"]
set tags=./.git/tags;
set notagrelative

"==============================================================================
" ctrlp tag settings
"==============================================================================
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|\.git/'
let g:ctrlp_working_path_mode = 0

"==============================================================================
" grepper settings
"==============================================================================
let g:grepper = {
            \   'ag': {
            \       'grepprg': 'ag --vimgrep '
            \   }
            \}

"==============================================================================
" lsp settings
"==============================================================================
set hidden

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
            \   'dart': [
            \       'dart',
            \       '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot',
            \       '--lsp',
            \       '--completion-model',
            \       '/usr/lib/dart/model/lexeme',
            \   ],
            \ }

let g:LanguageClient_rootMarkers = ['.git/']

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

"==============================================================================
" Gina settings
"==============================================================================
let g:gina#command#blame#formatter#format = "%au %su %ti"

"==============================================================================
" Gina settings
"==============================================================================
let g:repl_program = {
            \   'python': 'python',
            \   'default': 'zsh',
            \   }

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
set shell=zsh
set shellcmdflag=-c

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
set wrap

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set grepprg=grep\ -n\ $*
