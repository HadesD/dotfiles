function! init_runtime#Init() abort
  call s:CheckSSH()
  if v:version < 800 " || has('win32unix')
    call s:LoadPlugins()
  end
endfunction

function! s:CheckSSH()
  let g:is_ssh = 0
  if has('unix')
    let g:is_ssh = ($SSH_TTY != "")
  endif
endfunction

function s:LoadPlugins() abort
  :set runtimepath+=$HOME.'/.vim/autoload/vim-pathogen'
  if has('win32unix')
    execute pathogen#infect($HOME.'/pack/plugins/vendor/{}')
  else
    execute pathogen#infect('pack/plugins/vendor/{}')
  endif
endfunction

