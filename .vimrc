set autoread                                      " reload files when changed on disk
set number                                        " display line numbers on the left side
set relativenumber                                " set numbers to be relativer to actual position
set laststatus=2                                  " always display the status line
set showtabline=2
set splitbelow                                    " new splits will be at the bottom or to the right side of the screen
set splitright
set t_Co=256                                      " enable 256 colors
set background=dark                               " set background
set wildchar=<Tab> wildmenu wildmode=full         " set TAB the be the autocomplete
set wildignore+=**/node_modules/**                " when using :find, should ignore files in node_modules
set path+=**                                      " set current path to be searchable
set list                                          " show trailing space
set listchars=tab:\|.,trail:.,extends:»,precedes:«,nbsp:×
set tabstop=2                                     " tab use 2 spaces
set expandtab                                     " use space instead of spaces
set shiftwidth=2                                  " when using the >> or << commands, shift lines by 2 spaces

set updatetime=100                                " set time for vim to trigger events updates

colorscheme novum

set mouse=a                                       " add mouse suport
syntax enable                                     " enable syntax highlighting
set autoindent
set cursorline                                    " highlights current line
set showmatch                                     " show the matching part of the pair for [] {} and ()
ino ' ''<left>                                    " set autoclose of single quote
set directory-=.                                  " don't store swapfiles in the current directory

" Resize control
nmap <left> :vertical resize -5<CR>
nmap <up> :resize -5<CR>
nmap <down> :resize +5<CR>
nmap <right> :vertical resize +5<CR>

" Tabs
map <C-t>k :tabr<CR>
map <C-t>t :tabnew<CR>
map <C-t>h :tabp<CR>
map <C-t>l :tabn<CR>
map <C-t>1 :tabn1<CR>
map <C-t>2 :tabn2<CR>

" keyboard shortcuts
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" commands to compile in specific typefile
autocmd FileType markdown,md,rmd map <F5> :! (echo 'require("rmarkdown"); render("'%'");'<bar>  R --vanilla) <CR>
autocmd FileType c map <F5> :!gcc % && ./a.out <CR>
autocmd FileType python map <F5> :!python % <CR>
autocmd FileType cpp map <F5> :!g++ % && ./a.out <CR>
autocmd FileType tex map <F6> :!xelatex % && biber %:r && xelatex % <CR>
autocmd FileType tex map <F5> :!xelatex %<CR>




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

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

call vundle#end()            " required

filetype plugin indent on    " required

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
call NERDTreeHighlightFile('typescript', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" enable all Python syntax highlighting features
let python_highlight_all = 1

  " \ 'colorscheme': 'landscape',
" lightline config
let g:lightline = {
  \ 'colorscheme': 'deus',
  \}

if &term =~ '256color'
	" disable background color erase so that color schemes
	" render properly when inside 256-color tmux and GNU screen
	set t_ut=
endif

if !has('gui_running')
  set t_Co=256
endif

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

let g:ale_linters = {
\   'javascript': ['eslint']
\}

set noshowmode                                    " remove insert info
