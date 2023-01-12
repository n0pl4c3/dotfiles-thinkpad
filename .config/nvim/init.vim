" No compatibility with plain vi
set nocompatible 

" Show matching braces
set showmatch

" Disable case-sensitivity
set ignorecase

" Mouse Support
set mouse=a

" Highlight search results
set hlsearch

"Incremental Search
set incsearch

" Line numbering
set number
set relativenumber

" Command Completions
set wildmode=longest,list

" Line Width
set cc=80

" Indent based on filetype
filetype plugin indent on

" Syntax Highlighting
syntax on

" System Clipboard
set clipboard=unnamedplus

" Speed up scrolling
set ttyfast

" Tabs
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2

set t_Co=256

call plug#begin()
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
