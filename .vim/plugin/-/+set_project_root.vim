function! s:SetProjectRoot()
  lcd %:p:h
  if executable('git')
    let git_dir = system("git rev-parse --show-toplevel")
    let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
    if empty(is_not_git_dir)
      lcd `=git_dir`
    endif
  else
    let l:project_root_markers = ["/.git/", "/.cvs/", "/.svn/", "/.hg/", "/Makefile", "/Makefile.in", "/Makefile.am", "/package.json", "/bower.json", "/build.xml", "/pom.xml", "/build.gradle", "/Rakefile", "/CMakeLists.txt", "/configure", "/build.sbt", "/Makefile"]
    let ap = expand("%:p:h")
    let ap = substitute(ap,"\\","\/","g")
    let hit = 0
    while ap != ""
      for srm in l:project_root_markers
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
  end
endfunction

autocmd VimEnter * call s:SetProjectRoot()

