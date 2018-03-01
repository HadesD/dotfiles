finish
let s:dotfile = 'ruleset.xml'
let s:dotfile_filepath = g:dot_vim_dir . '/' . s:dotfile

if empty(glob(s:dotfile_filepath))
  finish
endif

if empty(glob(getcwd() . '/.git'))
  finish
endif

if !empty(glob(getcwd() . '/' . s:dotfile))
  finish
endif

if has('unix')
  let s:cmd = 'ln -s ' . s:dotfile_filepath . ' ' . getcwd()
elseif has('win32') || has('win64')
  let s:cmd = 'copy ' . s:dotfile_filepath . ' ' . getcwd()
endif

if exists('s:cmd')
  if exists(':AsyncRun')
    silent exe 'AsyncRun ' s:cmd
  else
    let run = system(s:cmd)
  end
end

