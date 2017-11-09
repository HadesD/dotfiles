autocmd BufNewFile,BufRead *.phtml set filetype=php.html
autocmd BufNewFile,BufRead *.phtml set syntax=php.html

" Disable automatic comment insertion
autocmd BufNewFile,BufRead * set formatoptions-=cro
