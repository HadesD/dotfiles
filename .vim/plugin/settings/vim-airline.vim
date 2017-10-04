if v:version < 703
  " Crash bug
  let s:_system = system("cd ~/.vim/bundle/vim-airline && git reset e7a5c97df13b3bcf1313e8dff6acf8a4675d6762 && git checkout .")
endif

let g:airline_detect_paste = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if g:is_ssh == 0
  if !has('win32unix') && !has('win32')
    let g:airline_powerline_fonts = 1
    let g:Powerline_symbols = 'fancy'
  endif
  " let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
else
endif

" --- If encoding  ---
if &encoding == 'utf-8'
  let g:airline_theme = 'angr'
  let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 1
elseif &encoding == "euc-jp"
  let g:airline_theme = 'angr'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.crypt = ''
  let g:airline_symbols.linenr = 'Line'
  let g:airline_symbols.maxlinenr = ' Col'
  let g:airline_symbols.branch = ''
  let g:airline_symbols.paste = 'PASTE'
  let g:airline_symbols.spell = 'S'
  let g:airline_symbols.notexists = ''
  let g:airline_symbols.whitespace = '|'
  let g:airline#extensions#tabline#enabled = 0
endif

