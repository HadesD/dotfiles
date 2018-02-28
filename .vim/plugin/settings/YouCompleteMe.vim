if v:version < 703 || (!has('python') && !has('python3'))
  let g:loaded_youcompleteme = 1
  finish
endif

let g:ycm_keep_logfiles                = 1
let g:ycm_log_level                    = 'debug'
let g:ycm_confirm_extra_conf           = 0
let g:ycm_complete_in_comments         = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filetype_blacklist           = { 'help': 1 }
let g:ycm_extra_conf_vim_data          = ['&filetype']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let s:dotfile = '.ycm_extra_conf.py'

let s:dotfile_filepath = g:dot_vim_dir . '/' . s:dotfile

if empty(glob(s:dotfile_filepath))
  finish
endif

if empty(glob(getcwd() . '/.git'))
  finish
endif

if glob(getcwd() . '/' . s:dotfile)
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

