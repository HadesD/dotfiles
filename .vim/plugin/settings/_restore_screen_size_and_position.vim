if !has('gui_running')
  finish
endif
" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1

if v:version > 700

  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif

else

  " Restore screen size and position
  " Saves data in a separate file, and so works with multiple instances of Vim.
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " - Remembers and restores winposition, columns and lines stored in
    "   a .vimsize file
    " - Must follow font settings so that columns and lines are accurate
    "   based on font size.
    if g:screen_size_restore_pos != 1
      return
    endif
    let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
    " read any existing variables from .vimsize file
    silent! execute "sview " . escape(ScreenFilename(),'%#\ $')
    silent! execute "0/^" . vim_instance . " /"
    let vim_name  = matchstr(getline('.'), '^\w\+')
    let vim_cols  = matchstr(getline('.'), '^\w\+\s\+\zs\d\+')
    let vim_lines = matchstr(getline('.'), '^\w\+\s\+\d\+\s\+\zs\d\+')
    let vim_posx  = matchstr(getline('.'), '^\w\+\s\+\d\+\s\+\d\+\s\+\zs\d\+')
    let vim_posy  = matchstr(getline('.'), '^\w\+\s\+\d\+\s\+\d\+\s\+\d\+\s\+\zs\d\+')
    if vim_name == vim_instance
      execute "set columns=".vim_cols
      execute "set lines=".vim_lines
      silent! execute "winpos ".vim_posx." ".vim_posy
    endif
    silent! q
  endfunction

  function! ScreenSave()
    " used on exit to retain window position and size
    if !g:screen_size_restore_pos
      return
    endif
    let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
    silent! execute "split " . escape(ScreenFilename(),'%#\ $')
    silent! execute "0/^" . vim_instance . " /"
    let vim_name  = matchstr(getline('.'), '^\w\+')
    if vim_name == vim_instance
      delete _
    endif
    $put = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
          \ (getwinposx()<0?0:getwinposx()) . ' ' .
          \ (getwinposy()<0?0:getwinposy())
    silent! x!
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * call ScreenRestore()
  autocmd VimLeavePre * call ScreenSave()

endif

