if v:version < 703 || !has('python')
  let g:loaded_EditorConfig = 1
  finish
endif

let s:dotfile = '.editorconfig'

if has('unix')
  let g:EditorConfig_exec_path = $HOME . '/.vim/' . s:dotfile
  let s:cmd = 'ln -s ' . g:EditorConfig_exec_path . ' .'
elseif has('win32') || has('win64')
  let g:EditorConfig_exec_path = $HOME . '/vimfiles/' . s:dotfile
  let s:cmd = 'copy ' . g:EditorConfig_exec_path . ' .'
endif
if exists('s:cmd')
  if !empty(glob(getcwd() . '/.git'))
        \ && empty(glob(getcwd() . '/' . s:dotfile))
        \ && !empty(glob(g:EditorConfig_exec_path))
    if exists(':AsyncRun')
      silent exe 'AsyncRun ' s:cmd
    else
      let run = system(s:cmd)
    end
  endif
end