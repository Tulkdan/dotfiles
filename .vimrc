set autoread                                      " reload files when changed on disk
set number                                        " display line numbers on the left side
set relativenumber                                " set numbers to be relativer to actual position
set laststatus=2                                  " always display the status line
set showtabline=2
set splitbelow                                    " new splits will be at the bottom or to the right side of the screen
set splitright
set wildchar=<Tab> wildmenu wildmode=full         " set TAB the be the autocomplete
set wildignore+=**/node_modules/**                " when using :find, should ignore files in node_modules
set path+=**                                      " set current path to be searchable
set list                                          " show trailing space
set listchars=tab:\|.,trail:.,extends:»,precedes:«,nbsp:×
set tabstop=2                                     " tab use 2 spaces
set expandtab                                     " use space instead of tabs
set shiftwidth=2                                  " when using the >> or << commands, shift lines by 2 spaces
set guicursor=                                    " makes vim to not change cursor shape

set updatetime=100                                " set time for vim to trigger events updates

set t_Co=256                                      " enable 256 colors
set background=dark                               " set background
colorscheme Blaaark                               " set colorscheme

set mouse=a                                       " add mouse suport
syntax enable                                     " enable syntax highlighting
set autoindent
set cursorline                                    " highlights current line
set showmatch                                     " show the matching part of the pair for [] {} and ()
set directory-=.                                  " don't store swapfiles in the current directory

set foldmethod=indent
set nofoldenable
set foldlevel=5

set updatetime=100                                " controls the delay that vim can write swap files

let mapleader = ","

" set autochdir                                     " set the working directory to be the same as the file that is been edited

ino ' ''<left>                                    " set autoclose of single quote


if filereadable(expand("~/.config/vim/aliases.vim"))
  source ~/.config/vim/aliases.vim
endif

if filereadable(expand("~/.config/vim/filetypes.vim"))
  source ~/.config/vim/filetypes.vim
endif


if filereadable(expand("~/.config/vim/skeletons.vim"))
  source ~/.config/vim/skeletons.vim
endif

if filereadable(expand("~/.config/vim/coc.vim"))
  source ~/.config/vim/coc.vim
endif

set nocompatible              " be iMproved, required
filetype plugin on


" Vundle configuration and plugins
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.config/vim/bundles.vim"))
  source ~/.config/vim/bundles.vim
endif

call vundle#end()            " required

filetype plugin indent on    " required

if filereadable(expand("~/.config/vim/nerdtree.vim"))
  source ~/.config/vim/nerdtree.vim
endif

if filereadable(expand("~/.config/vim/ale.vim"))
  source ~/.config/vim/ale.vim
endif

if filereadable(expand("~/.config/vim/test.vim"))
  source ~/.config/vim/test.vim
endif

" enable all Python syntax highlighting features
let python_highlight_all = 1

let g:lightline = {
  \ 'colorscheme': 'deus',
  \}

if &term =~ '256color'
	" disable background color erase so that color schemes
	" render properly when inside 256-color tmux and GNU screen
	set t_ut=
endif

set noshowmode                                    " remove insert info

if has('nvim') || has('termguicolors')
  set termguicolors
endif
