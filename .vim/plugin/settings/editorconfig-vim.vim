if v:version < 703
  let g:loaded_EditorConfig = 1
  finish
endif

let s:dotfile = '.editorconfig'

if has('unix') || has('win32unix')
  let g:EditorConfig_exec_path    = $HOME . '/.vim/' . s:dotfile
  if !empty(glob(getcwd() . '/.git'))
        \ && empty(glob(getcwd() . '/' . s:dotfile))
        \ && !empty(glob($HOME . '/.vim/' . s:dotfile))
    let s:symlink = system('ln -s ~/.vim/' . s:dotfile . ' .')
  endif
elseif has('win32') || has('win64')
  let g:EditorConfig_exec_path = $VIM . '/vimfiles/' . s:dotfile
endif
