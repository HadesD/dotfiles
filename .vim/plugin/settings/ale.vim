if !exists('g:ale_linters')
  let g:ale_linters = {}
endif

let g:ale_php_phpcs_standard = g:dot_vim_dir . '/phpcs.xml'

let s:ycm_dir = g:dot_vim_dir . '/pack/plugins/start/YouCompleteMe'
if has('unix')
  if !empty(glob(s:ycm_dir . '/third_party/ycmd/libclang.so*'))
    let s:use_ycm = 1
  endif
endif

if exists('s:use_ycm')
  let g:ale_linters.c = []
  let g:ale_linters.cpp = []
endif

