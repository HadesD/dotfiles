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
  if (exists('g:dot_vim_dir'))
    let &rtp = &rtp . ',' . g:dot_vim_dir . '/autoload/vim-pathogen'
  endif
  if has('win32unix')
    execute pathogen#infect(g:dot_vim_dir.'/pack/plugins/start/{}')
  else
    execute pathogen#infect('pack/plugins/start/{}')
  endif
endfunction

