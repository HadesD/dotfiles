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

let s:dotfile = '.ycm_extra_conf.py'

if has('unix')
  let g:ycm_global_ycm_extra_conf = $HOME . '/.vim/' . s:dotfile
  if !empty(glob(getcwd() . '/.git'))
        \ && empty(glob(getcwd() . '/' . s:dotfile))
        \ && !empty(glob($HOME . '/.vim/' . s:dotfile))
    let s:symlink = system('ln -s ~/.vim/' . s:dotfile . ' .')
  endif
elseif has('win32') || has('win64')
  let g:ycm_global_ycm_extra_conf = $VIM . '/vimfiles/' . s:dotfile
endif
