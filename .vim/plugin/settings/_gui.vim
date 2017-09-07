set t_Co=256  " vim-monokai now only support 256 colours in terminal.
set background=dark
colorscheme monokai

" hi IndentGuidesOdd  ctermbg=None
hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=235

" highlight NonText guifg=#abc123 ctermfg=123
highlight NonText guifg=bg ctermfg=bg

if &encoding != "euc-jp"
  set fillchars=vert:\│
endif

autocmd BufRead,BufNewFile .tmux.conf setf sh

" Block cursor
if has('win32unix')
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif
