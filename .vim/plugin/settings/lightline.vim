set noshowmode

let g:lightline = {}
let g:lightline.colorscheme = 'jellybeans'
let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'left',
      \ }
let g:lightline.component_function = {
      \  'fileformat': 'LightlineFileformat',
      \  'filetype': 'LightlineFiletype',
      \  'filename': 'LightlineFilename',
      \ }
let g:lightline.active = {}
let g:lightline.active.right = [
      \   ['linter_errors', 'linter_warnings', 'linter_ok'],
      \   ['lineinfo'],
      \   ['fileformat', 'fileencoding', 'filetype'],
      \ ]
let g:lightline.active.left = [
      \   ['mode', 'paste'],
      \   ['readonly', 'filename'],
      \ ]

" --- Functionals
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : '') : ''
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? '[+]' : ''
  return filename . modified
endfunction

