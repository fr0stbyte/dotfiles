call pathogen#infect()
call pathogen#helptags()

" set large font
set guifont=Monaco:h18

set nocompatible
syntax on
filetype plugin indent on

" Solarized
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set history=700

" autoread file when modified from outside
set autoread 

" disable error messages
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Fix backspacing
set backspace=indent,eol,start

" disable backup
set nobackup
set noswapfile
set nowb

" tabs
set autoindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2

set nowrap
set number
set linebreak
set nolist
set showbreak=\ \ \ \

" show status line
set ls=2
set ruler

" show current line
set cursorline

augroup markdown
  au!
  au BufNewFile, BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

set tags=./.tags,.tags,./tags,tags
