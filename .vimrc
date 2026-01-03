" =============================================================================
"  VIM CONFIG - Augusto Hermosilla
" =============================================================================

" -----------------------------------------------------------------------------
" GENERAL
" -----------------------------------------------------------------------------
set nocompatible              " Disable vi compatibility
set encoding=utf-8            " UTF-8 encoding
set hidden                    " Allow switching buffers without saving
set history=1000              " Command history
set undolevels=1000           " Undo history
set autoread                  " Reload files changed outside vim
set backspace=indent,eol,start " Backspace over everything

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
set number                    " Show line numbers
set relativenumber            " Relative line numbers
set cursorline                " Highlight current line
set showcmd                   " Show command in bottom bar
set showmode                  " Show current mode
set wildmenu                  " Visual autocomplete for command menu
set wildmode=list:longest     " Complete files like shell
set laststatus=2              " Always show status line
set ruler                     " Show cursor position
set scrolloff=8               " Keep 8 lines above/below cursor
set sidescrolloff=8           " Keep 8 columns left/right of cursor
set signcolumn=yes            " Always show sign column

" -----------------------------------------------------------------------------
" COLORS
" -----------------------------------------------------------------------------
syntax enable                 " Enable syntax highlighting
set termguicolors             " True color support
set background=dark           " Dark background

" -----------------------------------------------------------------------------
" INDENTATION
" -----------------------------------------------------------------------------
set autoindent                " Copy indent from current line
set smartindent               " Smart autoindenting
set expandtab                 " Use spaces instead of tabs
set tabstop=4                 " Tab = 4 spaces
set shiftwidth=4              " Indent = 4 spaces
set softtabstop=4             " Tab key = 4 spaces
filetype plugin indent on     " Enable filetype detection

" -----------------------------------------------------------------------------
" SEARCH
" -----------------------------------------------------------------------------
set incsearch                 " Search as you type
set hlsearch                  " Highlight matches
set ignorecase                " Case insensitive search
set smartcase                 " Unless uppercase is used

" Clear search highlight with Escape
nnoremap <Esc> :nohlsearch<CR>

" -----------------------------------------------------------------------------
" SPLITS
" -----------------------------------------------------------------------------
set splitbelow                " Horizontal splits below
set splitright                " Vertical splits to the right

" Navigate splits with Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------
" Leader key
let mapleader = " "

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Move lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" -----------------------------------------------------------------------------
" FILES
" -----------------------------------------------------------------------------
set noswapfile                " No swap files
set nobackup                  " No backup files
set undofile                  " Persistent undo
set undodir=~/.vim/undodir    " Undo directory

" Create undo directory if it doesn't exist
if !isdirectory($HOME . "/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif

" -----------------------------------------------------------------------------
" MISC
" -----------------------------------------------------------------------------
set mouse=a                   " Enable mouse
set clipboard=unnamed         " Use system clipboard
set updatetime=300            " Faster updates
set timeoutlen=500            " Mapping timeout

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
