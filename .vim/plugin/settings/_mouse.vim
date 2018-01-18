function! _toogleMouse(...) abort
  if (&mouse == 'a')
    set mouse=c
  else
    set mouse=a
  end
endfunction

nnoremap <F4> :call _toogleMouse()<CR>
map <F4> :call _toogleMouse()<CR>

