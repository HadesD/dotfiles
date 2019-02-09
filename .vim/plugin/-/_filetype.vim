autocmd BufNewFile,BufRead *.phtml set filetype=php.html | set syntax=php.html
autocmd BufNewFile,BufRead *.ctp set filetype=php.html

" Disable automatic comment insertion
autocmd BufNewFile,BufRead .babelrc set filetype=json | set syntax=json

" autocmd BufRead,BufNewFile .tmux.conf setf sh
autocmd BufRead,BufNewFile *.tmux.conf set filetype=tmux | set syntax=sh

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug

