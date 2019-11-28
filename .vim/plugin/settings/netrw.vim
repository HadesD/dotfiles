nnoremap <silent> <C-m> :Lex<CR>
noremap <silent> <C-E> :Lex<CR>
autocmd FileType netrw setl bufhidden=delete
" let g:netrw_fastbrowse = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_sort_sequence = '[\/]$,*'

if has('unix')
  let g:netrw_localrmdir='rm -r'
endif

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
    endif
    unlet t:expl_buf_num
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction
" noremap <silent> <C-E> :call ToggleVExplorer()<CR>

function! OpenVFile()
  exec 'wincmd w | vsp | 1wincmd w'
endfunction

function! OpenSFile()
  exec 'wincmd w | sp | 1wincmd w'
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> o :<CR><CR>
  nmap <buffer> v :call OpenVFile()<CR><CR>
  nmap <buffer> s :call OpenSFile()<CR><CR>
endfunction

