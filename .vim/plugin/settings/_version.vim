if v:version > 703
  " --- >= 7.4 ---
  set conceallevel=0
else
  " --- Disable plugin can't use in < 7.4 ---
  let g:loaded_neosnippet = 1
end

