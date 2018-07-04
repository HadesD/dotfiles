if v:version <= 704 && !has('patch53')
  let g:matchup_enabled = 0
  finish
endif

