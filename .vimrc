set number
set relativenumber

set laststatus=2
set showtabline=2
set t_Co=256                         " Enable 256 colors

colorscheme monotonic

set wildchar=<Tab> wildmenu wildmode=full

set wildignore+=**/node_modules/**

set list listchars=tab:\|.,trail:.,extends:»,precedes:«,nbsp:×
set tabstop=2
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2

" enable syntax highlighting
syntax enable
set autoindent
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

autocmd FileType markdown,md,rmd map <F5> :! (echo 'require("rmarkdown"); render("'%'");'<bar>  R --vanilla) <CR>
autocmd FileType c map <F5> :!gcc % && ./a.out <CR>
autocmd FileType python map <F5> :!python % <CR>
autocmd FileType cpp map <F5> :!g++ % && ./a.out <CR>
autocmd FileType tex map <F6> :!pdflatex % && biber %:r && pdflatex % <CR>
autocmd FileType tex map <F5> :!pdflatex % && pdflatex % <CR>

nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>
nnoremap ,py :-1read $HOME/.vim/.skeleton.py<CR>

set nocompatible              " be iMproved, required
filetype plugin on
" filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
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


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jreybert/vimagit'
Plugin 'townk/vim-autoclose'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'soywod/kronos.vim'

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
call NERDTreeHighlightFile('vue', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" airline
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_theme                        = 'base16_atelierdune'
let g:airline_powerline_fonts              = 1

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable javascript libraries highlights
let g:user_javascript_libs = 'vue, react'

if &term =~ '256color'
	" disable background color erase so that color schemes
	" render properly when inside 256-color tmux and GNU screen
	set t_ut=
endif

