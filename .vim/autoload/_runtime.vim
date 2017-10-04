function! _runtime#init(...) abort
  call _runtime#checkSSH()
  if has('unix')
    let s:dot_vim = $HOME.'/.vim'
  elseif (has('win32') || has('win64')) && !has('win32unix')
    let s:dot_vim = $HOME.'/vimfiles'
	set enc=utf-8
  end
  if (exists('s:dot_vim'))
    let &rtp = &rtp.','.s:dot_vim.'/autoload/vim-pathogen,'.s:dot_vim.'/bundle/powerline/powerline/bindings/vim'
  endif
  set encoding=utf-8
  execute pathogen#infect()
endfunction

function _runtime#checkSSH() abort
  let g:is_ssh = 0
  if has('unix')
    let g:is_ssh = ($SSH_TTY != "")
  endif
endfunction
