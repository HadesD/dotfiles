autocmd BufNewFile,BufRead *.phtml set filetype=php.html
autocmd BufNewFile,BufRead *.phtml set syntax=php.html

" Disable automatic comment insertion
autocmd BufNewFile,BufRead * set formatoptions-=cro
autocmd BufNewFile,BufRead .babelrc set filetype=json | set syntax=json

autocmd BufNewFile,BufRead *.blade.chtml set filetype=cppcmstmpl.html | set syntax=cppcmstmpl.html
