if v:version > 703
  " --- >= 7.4 ---
  set conceallevel=0
else
  " --- Disable plugin can't use in < 7.4 ---
  let g:loaded_youcompleteme = 1
  let g:loaded_nerdtree_git_status = 1
  let g:loaded_neosnippet = 1
  let g:loaded_neocomplete = 1
end

