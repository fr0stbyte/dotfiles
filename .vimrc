set encoding=utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" vundle to manage vundle
Plugin 'auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'derekwyatt/vim-scala'
Plugin 'Erlang-plugin-package'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'nerdtree'
Plugin 'supertab'
Plugin 'syntastic'
Plugin 'Scala-Java-Edit'
Plugin 'Scheme-Mode'
Plugin 'Solarized'
Plugin 'tpope/vim-fugitive'
call vundle#end()

" allow easier buffer switching -- even if the buffer is modified
set hidden
" nerdtree
map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on

" set large font
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16

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

let g:airline_symbols.branch = "\uf020"
