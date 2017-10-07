if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
  set langmenu=en_US
  let $LANG = 'en_US'
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
else
  " Block cursor
  set t_Co=256  " vim-monokai now only support 256 colours in terminal.
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  if has('win32unix')
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
  elseif has('win32') || has('win64')
    set term=xterm
  endif
endif

set background=dark
colorscheme monokai

" hi IndentGuidesOdd  ctermbg=None
hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=235

" highlight NonText guifg=#abc123 ctermfg=123
highlight NonText guifg=bg ctermfg=bg

autocmd BufRead,BufNewFile .tmux.conf setf sh

set fillchars=vert:\│

