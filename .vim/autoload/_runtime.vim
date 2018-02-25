function! _runtime#init(...) abort
  call _runtime#checkSSH()
  if v:version < 800
    call _runtime#loadPlugins()
  end
endfunction

function _runtime#checkSSH() abort
  let g:is_ssh = 0
  if has('unix')
    let g:is_ssh = ($SSH_TTY != "")
  endif
endfunction

function _runtime#loadPlugins() abort
  let s:dot_vim = $HOME
  if has('unix')
    let s:dot_vim = $HOME.'/.vim'
  elseif (has('win32') || has('win64')) && !has('win32unix')
    let s:dot_vim = $HOME.'/vimfiles'
  end
  if (exists('s:dot_vim'))
    let &rtp = &rtp . ',' . s:dot_vim.'/autoload/vim-pathogen'
  endif
  execute pathogen#infect('pack/plugins/start/{}')
endfunction

