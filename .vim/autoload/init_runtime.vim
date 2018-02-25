function! init_runtime#Init() abort
  call CheckSSH()
  call DotVimDir()
  if v:version < 800
    call LoadPlugins()
  end
endfunction

function! CheckSSH()
  let g:is_ssh = 0
  if has('unix')
    let g:is_ssh = ($SSH_TTY != "")
  endif
endfunction

function! DotVimDir()
  let g:dot_vim_dir = $HOME
  if has('unix')
    let g:dot_vim_dir = $HOME.'/.vim'
  elseif (has('win32') || has('win64')) && !has('win32unix')
    let g:dot_vim_dir = $HOME.'/vimfiles'
  end
endfunction

function LoadPlugins() abort
  if (exists('g:dot_vim_dir'))
    let &rtp = &rtp . ',' . g:dot_vim_dir . '/autoload/vim-pathogen'
  endif
  execute pathogen#infect('pack/plugins/start/{}')
endfunction

