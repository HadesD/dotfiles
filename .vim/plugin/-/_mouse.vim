function! _toogleMouse(...) abort
  let is_found = stridx(&mouse, 'a')
  if (is_found)
    set mouse+=a
  else
    set mouse-=a
  end
endfunction

nnoremap <F4> :call _toogleMouse()<CR>
map <F4> :call _toogleMouse()<CR>

