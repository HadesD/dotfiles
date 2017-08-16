let g:airline_detect_paste = 1
let g:airline_theme = 'angr'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let s:remoteSession = ($STY == "")
if s:remoteSession
  let g:airline_powerline_fonts = 1
  let g:Powerline_symbols = 'fancy'
  " let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
else
endif
" --- If encoding  ---
if &encoding == 'utf-8'
  let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 1
else
  let g:airline#extensions#tabline#enabled = 0
endif

