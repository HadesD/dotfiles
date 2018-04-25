" follow symlinked file
function! s:FollowSymlink()
  let current_file = expand('%:p')
  " check if file type is a symlink
  if getftype(current_file) == 'link'
    " if it is a symlink resolve to the actual file path
    "   and open the actual file
    let actual_file = resolve(current_file)
    silent! execute 'file ' . actual_file
  end
endfunction

" set working directory to git project root
" or directory of current file if not git project
function! s:SetProjectRoot()
  " default to the current file's directory
  lcd %:p:h
  if !executable('git')
    return
  end
  let git_dir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  " if git project, change local directory to git project root
  if empty(is_not_git_dir)
    lcd `=git_dir`
  endif
endfunction

" netrw: follow symlink and set working directory
autocmd CursorMoved silent *
  " short circuit for non-netrw files
  \ if &filetype == 'netrw' |
  \   call s:FollowSymlink() |
  \   call s:SetProjectRoot() |
  \ endif

" follow symlink and set working directory
autocmd BufRead *
  \ call s:FollowSymlink() |
  \ call s:SetProjectRoot()

