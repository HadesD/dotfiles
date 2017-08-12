" Preserve noeol (missing trailing eol) when saving file. In order
" to do this we need to temporarily 'set binary' for the duration of
" file writing, and for DOS line endings, add the CRs manually.
" For Mac line endings, also must join everything to one line since it doesn't
" use a LF character anywhere and 'binary' writes everything as if it were Unix.

" This works because 'eol' is set properly no matter what file format is used,
" even if it is only used when 'binary' is set.

augroup automatic_noeol
  au!
  au BufWritePre  * call <SID>TempSetBinaryForNoeol()
  au BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END

function! s:TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif
    if &ff == "mac"
      undojoin | %join!
      " mac format does not use a \n anywhere, so we don't add one when writing
      " in binary (which uses unix format always). However, inside the outer
      " if statement, we already know that 'noeol' is set, so no special logic
      " is needed.
    endif
  endif
endfunction

function! s:TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        " Sometimes undojoin gives errors here, even when it shouldn't.
        " Suppress them for now...if you can figure out and fix them instead,
        " please update http://vim.wikia.com/wiki/VimTip1369
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      " Sometimes undojoin gives errors here, even when it shouldn't.
      " Suppress them for now...if you can figure out and fix them instead,
      " please update http://vim.wikia.com/wiki/VimTip1369
      silent! undojoin | silent %s/\r/\r/ge
    endif
    setlocal nobinary
    call winrestview(s:save_view)
  endif
endfunction
