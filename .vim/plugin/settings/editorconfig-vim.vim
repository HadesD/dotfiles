if (!has('python') && !has('python3'))
  let g:loaded_EditorConfig = 1
  finish
endif

let s:dotfile = '.editorconfig'
let s:dotfile_filepath = g:dot_vim_dir . '/' . s:dotfile

if !filereadable(s:dotfile_filepath)
  finish
endif

if empty(glob(getcwd() . '/.git'))
  finish
endif

if glob(getcwd() . '/' . s:dotfile)
  finish
endif

call Symlink(s:dotfile_filepath, getcwd())

