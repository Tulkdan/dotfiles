" display line numbers on the left side
set number
set relativenumber

" always display the status line
set laststatus=2
set showtabline=2

" new splits will be at the bottom or to the right side of the screen
set splitbelow
set splitright

" enable 256 colors
set t_Co=256

" add mouse suport
set mouse=a

colorscheme Blaaark

" set background
set background=dark

set wildchar=<Tab> wildmenu wildmode=full

" when using :find, should ignore files in node_modules
set wildignore+=**/node_modules/**
set path+=**

set list listchars=tab:\|.,trail:.,extends:»,precedes:«,nbsp:×
set tabstop=2
set expandtab

" when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2

" enable syntax highlighting
syntax enable
set autoindent

" highlights current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" set autoclose of single quote
ino ' ''<left>

set swapfile
set dir=~/tmp




" commands to compile in specific typefile
autocmd FileType markdown,md,rmd map <F5> :! (echo 'require("rmarkdown"); render("'%'");'<bar>  R --vanilla) <CR>
autocmd FileType c map <F5> :!gcc % && ./a.out <CR>
autocmd FileType python map <F5> :!python % <CR>
autocmd FileType cpp map <F5> :!g++ % && ./a.out <CR>
autocmd FileType tex map <F6> :!pdflatex % && biber %:r && pdflatex % <CR>
autocmd FileType tex map <F5> :!pdflatex % && pdflatex % <CR>




" custom skeletons
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>
nnoremap ,py :-1read $HOME/.vim/.skeleton.py<CR>
nnoremap ,tex :-1read $HOME/.vim/.skeleton.tex<CR>


set nocompatible              " be iMproved, required
filetype plugin on
" filetype off                  " required


" Vundle configuration and plugins
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jreybert/vimagit'
Plugin 'townk/vim-autoclose'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'itchyny/lightline.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable javascript libraries highlights
let g:user_javascript_libs = 'react'

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \}

if &term =~ '256color'
	" disable background color erase so that color schemes
	" render properly when inside 256-color tmux and GNU screen
	set t_ut=
endif

if !has('gui_running')
  set t_Co=256
endif

" remove insert info
set noshowmode
