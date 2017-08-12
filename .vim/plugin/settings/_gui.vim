set t_Co=256  " vim-monokai now only support 256 colours in terminal.
set background=dark
colorscheme monokai

" hi IndentGuidesOdd  ctermbg=None
hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=235

" highlight NonText guifg=#abc123 ctermfg=123
highlight NonText guifg=bg ctermfg=bg

" set enc=utf-8
set fillchars=vert:\│

autocmd BufRead,BufNewFile .tmux.conf setf sh
