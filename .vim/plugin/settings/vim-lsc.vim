" let g:lsc_auto_map = v:true
autocmd CompleteDone * silent! pclose
let g:lsc_auto_map = {
      \  'GoToDefinition': '<C-]>',
      \  'FindReferences': 'gr',
      \  'NextReference': '<C-n>',
      \  'PreviousReference': '<C-p>',
      \  'FindImplementations': 'gI',
      \  'FindCodeActions': 'ga',
      \  'DocumentSymbol': 'go',
      \  'WorkspaceSymbol': 'gS',
      \  'ShowHover': 'K',
      \  'Completion': 'completefunc',
      \ }

let g:lsc_server_commands = {
      \   'c': {
      \     'command': 'clangd',
      \   },
      \   'cpp': {
      \     'command': 'clangd',
      \   },
      \ }

