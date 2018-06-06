if &enc != 'utf-8'
  let g:lsp_loaded = 1
endif
" let g:lsp_loaded = 1
" finish
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'} " icons require GUI
let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

highlight link LspErrorText GruvboxRedSign
highlight clear LspWarningLine

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" Bind
nnoremap gr :LspReferences<CR>
nnoremap gR :LspRename<CR>
nnoremap go :LspDocumentSymbol<CR>
nnoremap gS :LspWorkspaceSymbol<CR>
nnoremap gI :LspImplementation<CR>
nnoremap gd :LspDefinition<CR>
nnoremap K :LspHover<CR>

