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

if v:version < 800
  function! ToggleVExplorer()
      if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
        let cur_win_nr = winnr() - 1
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
  noremap <silent> <C-m> :call ToggleVExplorer()<CR>
else
  noremap <silent> <C-m> :Lex<CR>
endif

function! OpenVFile()
  exec 'wincmd w | vsp | 1wincmd w'
endfunction

function! OpenSFile()
  exec 'wincmd w | sp | 1wincmd w'
endfunction

fun! NetrwRefresh()
  let screenposn = winsaveview()
  NetrwKeepj call netrw#LocalBrowseCheck(b:netrw_curdir)
  NetrwKeepj call winrestview(screenposn)
endf

function! CreateInPreview()
  let l:filename = input("Enter filename to create in <".b:netrw_curdir.">: ")
  if l:filename != ''
    let l:filefullname = b:netrw_curdir.'/'.l:filename
    if !filereadable(l:filefullname)
      call system('touch "'.l:filefullname.'"')
      call NetrwRefresh()
    else
      redraw!
      echoerr l:filefullname.':'.'File exists or can not create '
    endif
  endif
endf

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer>o :<CR><CR>
  nmap <buffer>v :call OpenVFile()<CR><CR>
  nmap <buffer>s :call OpenSFile()<CR><CR>
  " nmap <buffer> x :call NetrwCollapse()<CR><CR>
  nmap <buffer>% :call CreateInPreview()<cr>
  nmap <buffer><C-l> :call NetrwRefresh()<cr>
endfunction

