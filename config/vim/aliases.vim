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

" Keyboard shortcuts
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Find files using Telescope command-line sugar.
nnoremap <C-f>f <cmd>Telescope find_files<cr>
nnoremap <C-f>b <cmd>Telescope buffers<cr>
nnoremap <C-f>h <cmd>Telescope help_tags<cr>

" go to Normal mode on integrated terminal
tnoremap <Esc> <C-\><C-n>
