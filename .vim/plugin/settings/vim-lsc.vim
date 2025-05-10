finish " has vim-lsp
if v:version < 800
  let g:loaded_lsc = 1
  " let g:lsc_enable_autocomplete = 1
  finish
endif

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

" Config servers
if !exists('g:lsc_server_commands')
  let g:lsc_server_commands = {}
endif

if executable('clangd')
  let g:lsc_server_commands.c = {
        \   'command': 'clangd',
        \   'suppress_stderr': 1
        \ }
  let g:lsc_server_commands.cpp = {
        \   'command': 'clangd',
        \   'suppress_stderr': 1
        \ }
endif

