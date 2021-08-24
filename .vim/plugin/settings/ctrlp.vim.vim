if (executable('fzf') || executable('fzy'))
  if (executable('fzf'))
    nmap <C-P> :FloatermNew fzf<CR>
  else
    nmap <C-P> :FloatermNew fzy<CR>
  endif
  let g:loaded_ctrlp = 1
endif

let g:ctrlp_show_hidden = 1

