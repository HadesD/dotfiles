let g:gitgutter_git_executable = 'git'
if !executable(g:gitgutter_git_executable)
  let g:loaded_gitgutter = 1
  finish
end

