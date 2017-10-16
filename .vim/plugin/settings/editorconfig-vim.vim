if v:version < 703
  let g:loaded_EditorConfig = 1
  finish
endif

let s:dotfile = '.editorconfig'

if has('unix') || has('win32unix')
  let g:EditorConfig_exec_path = $HOME . '/.vim/' . s:dotfile
  if !empty(glob(getcwd() . '/.git'))
        \ && empty(glob(getcwd() . '/' . s:dotfile))
        \ && !empty(glob(g:EditorConfig_exec_path))
    let s:symlink = system('ln -s ' . g:EditorConfig_exec_path . ' ' . getcwd())
  endif
elseif has('win32') || has('win64')
  let g:EditorConfig_exec_path = $HOME . '/vimfiles/' . s:dotfile
  if !empty(glob(getcwd() . '/.git'))
        \ && empty(glob(getcwd() . '/' . s:dotfile))
        \ && !empty(glob(g:EditorConfig_exec_path))
    let s:path = substitute(g:EditorConfig_exec_path, "\\", "/", "")
    let s:cmd = 'copy ' . s:path . ' ' . getcwd() . '/' . s:dotfile
    let s:symlink = system(s:cmd)
    exe 'echom ' '"'.s:cmd.'"'
  endif
endif
