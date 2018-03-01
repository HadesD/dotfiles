set noshowmode

let g:lightline = {}
" let g:lightline.colorscheme = 'OldHope'
let g:lightline.colorscheme = 'Tomorrow_Night_Eighties'
let g:lightline.component_expand = {
      \  'linter_warnings': 'LinterWarnings',
      \  'linter_errors': 'LinterErrors',
      \  'linter_ok': 'LinterOk',
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

" Functionals
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

function! LinterWarnings()
  let l:result = ''
  if (index(['c', 'cpp'], &filetype) >= 0)
    let l:returnCount = youcompleteme#GetWarningCount()
    let l:result = (l:returnCount == 0) ? '' : printf('E:%d', l:returnCount)
  else
    let l:result = lightline#ale#warnings()
  endif

  return l:result
endfunction

function! LinterErrors()
  let l:result = ''
  if (index(['c', 'cpp'], &filetype) >= 0)
    let l:returnCount = youcompleteme#GetErrorCount()
    let l:result = (l:returnCount == 0) ? '' : printf('E:%d', l:returnCount)
  else
    let l:result = lightline#ale#errors()
  endif

  return l:result
endfunction

function! LinterOk()
  let l:result = ''
  if (index(['c', 'cpp'], &filetype) >= 0)
    if empty(LinterErrors()) && empty(LinterWarnings())
      let l:result = 'OK'
    endif
  else
    let l:result = lightline#ale#ok()
  endif

  return l:result
endfunction

