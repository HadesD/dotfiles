if !exists('g:ale_linters')
  let g:ale_linters = {}
endif

if executable('phpcs')
  if (g:is_ssh)
    let g:ale_php_phpcs_executable = ''
  else
    let g:ale_php_phpcs_standard = g:dot_vim_dir . '/phpcs.xml'
  endif
endif

if executable('phpmd')
  if (g:is_ssh)
    let g:ale_php_phpmd_executable = ''
  endif
endif

if executable('htmlhint')
  if (g:is_ssh)
    let g:ale_html_htmlhint_executable = ''
  endif
endif

if filereadable(getcwd() . '/compile_commands.json')
  if executable('clangd')
    let g:ale_linters.c = []
    let g:ale_linters.cpp = []
  endif
endif

