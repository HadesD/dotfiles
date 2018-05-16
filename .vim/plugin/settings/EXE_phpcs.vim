if !executable('phpcs')
  finish
endif

if empty(glob('composer.json'))
  finish
endif

let s:dotfile = 'ruleset.xml'
let s:dotfile_filepath = g:dot_vim_dir . '/' . s:dotfile

if empty(glob(s:dotfile_filepath))
  finish
endif

if !empty(glob(getcwd() . '/' . s:dotfile))
  finish
endif

call Symlink(s:dotfile_filepath, getcwd())

