if v:version < 703 || (!has('python') && !has('python3'))
  let g:loaded_youcompleteme = 1
  finish
endif

set encoding=utf-8
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

if has('unix')
  let g:ycm_global_ycm_extra_conf = $HOME . '/.vim/' . s:dotfile
  let s:cmd = 'ln -s ' . g:ycm_global_ycm_extra_conf . ' ' . getcwd()
elseif has('win32') || has('win64')
  let g:ycm_global_ycm_extra_conf = $HOME . '/vimfiles/' . s:dotfile
  let s:cmd = 'copy ' . g:ycm_global_ycm_extra_conf . ' ' . getcwd() . ' -O -X -E -H -K'
endif

if exists('s:cmd')
  if !empty(glob(getcwd() . '/.git'))
        \ && empty(glob(getcwd() . '/' . s:dotfile))
        \ && !empty(glob(g:ycm_global_ycm_extra_conf))
    if exists(':AsyncRun')
      silent exe 'AsyncRun ' s:cmd
    else
      let run = system(s:cmd)
    end
  endif
end
