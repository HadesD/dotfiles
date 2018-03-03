if has('win32') || has('win64')
  source $VIMRUNTIME/mswin.vim
  set iminsert=0
  set imsearch=-1
  inoremap <ESC> <ESC>:set iminsert=0<CR>
  if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
  endif
end

