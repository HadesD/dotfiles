" if executable('ag')
  " let g:ackprg = 'ag --vimgrep'
" endif

if executable('ack')
  let g:ackprg = 'ack --ignore-dir=logs'
  abbreviate ack Ack
endif

if executable('ag')
  abbreviate ag Ack
endif

