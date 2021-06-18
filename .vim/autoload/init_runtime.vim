function! init_runtime#Init() abort
  call s:CheckSSH()
  if v:version < 800 " || has('win32unix')
    call s:LoadPlugins()
  end

  " After load

  let g:polyglot_disabled = ['cpp']

  if (v:version < 702)
    g:polyglot_disabled = add(g:polyglot_disabled, 'julia')
  endif
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
    execute pathogen#infect($HOME.'/.vim/pack/vendor/{}')
  else
    execute pathogen#infect('pack/vendor/{}')
  endif
endfunction

