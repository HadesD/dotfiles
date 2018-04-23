if !isdirectory(g:dot_vim_dir . '/pack/plugins/start/YouCompleteMe')
  finish
endif

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

" config compile
if filereadable(getcwd() . '/compile_commands.json')
  finish
endif

let s:dotfile = '.ycm_extra_conf.py'

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

