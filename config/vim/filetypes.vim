" commands to compile in specific typefile
autocmd FileType markdown,md,rmd map <F5> :! (echo 'require("rmarkdown"); render("'%'");'<bar>  R --vanilla) <CR>

" Python
autocmd FileType python map <F5> :!python3.8 % <CR>

" C/C++
autocmd FileType c map <F5> :!gcc % && ./a.out <CR>
autocmd FileType cpp map <F5> :!g++ % && ./a.out <CR>

" TexFiles
autocmd FileType tex map <F6> :!xelatex % && biber %:r && xelatex % <CR>
autocmd FileType tex map <F5> :!xelatex %<CR>

" JS
autocmd FileType javascript map <F6> :!npm run test %  -- --coverage=false<CR>
