set nocompatible                "be iMproved, required
filetype off                    "required
"==============================================================================
" Vundle settings
"==============================================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'
"Plugin 'Yggdroot/indentLine'

call vundle#end()
filetype on
"==============================================================================
" Vim-airline settings
"==============================================================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"==============================================================================
" YouCompleteMe settings
"==============================================================================
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
"==============================================================================
" Indent guides settings
"==============================================================================
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"==============================================================================
" General settings
"==============================================================================
set background=dark
colorscheme bubblegum-256-dark
"colorscheme atom-dark-256
"colorscheme breezy

" cursor setttings
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

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

set visualbell t_vb= 
set novisualbell

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
