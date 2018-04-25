" let g:lsc_loaded = 1
" finish
autocmd CompleteDone * silent! pclose

let g:lsc_auto_map = {
      \  'GoToDefinition': 'gd',
      \  'FindReferences': 'gr',
      \  'NextReference': '<C-n>',
      \  'PreviousReference': '<C-p>',
      \  'FindImplementations': 'gI',
      \  'FindCodeActions': 'ga',
      \  'Rename': 'gR',
      \  'ShowHover': 'K',
      \  'DocumentSymbol': 'go',
      \  'WorkspaceSymbol': 'gS',
      \  'Completion': 'completefunc',
      \ }
let g:lsc_auto_map = v:false

" Config servers
if !exists('g:lsc_server_commands')
  let g:lsc_server_commands = {}
endif

if executable('clangd')
  let g:lsc_server_commands.c = {
        \   'command': 'clangd',
        \   'suppress_stderr': v:true
        \ }
  let g:lsc_server_commands.cpp = {
        \   'command': 'clangd',
        \   'suppress_stderr': v:true
        \ }
endif

