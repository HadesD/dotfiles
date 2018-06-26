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
    let is_not_git_dir = 1
  end
  if !has('is_not_git_dir')
    let git_dir = system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
    " if git project, change local directory to git project root
    if empty(is_not_git_dir)
      lcd `=git_dir`
    endif
  endif

  if has('is_not_git_dir') && empty(is_not_git_dir)
    let l:project_root_markers = ["/.git/", "/.cvs/", "/.svn/", "/.hg/", "/Makefile", "/Makefile.in", "/Makefile.am", "/package.json", "/bower.json", "/build.xml", "/pom.xml", "/build.gradle", "/Rakefile", "/CMakeLists.txt", "/configure", "/build.sbt", "/Makefile"]
    let ap = expand("%:p:h")
    let ap = substitute(ap,"\\","\/","g")
    let hit = 0
    while ap != ""
      for srm in g:ag_src_root_markers
        if (srm[-1:-1] == "/" && isdirectory(ap.srm)) || filereadable(ap.srm)
          let hit = 1
          break
        endif
      endfor

      if hit == 0
        let ap = substitute(ap, '/[^/]\+$', "","")
      else
        break
      endif
    endwhile

    if ap != ""
      lcd `=ap`
    endif
  endif
endfunction

" follow symlink and set working directory
autocmd BufRead *
      \ call s:FollowSymlink() |
      \ call s:SetProjectRoot()

