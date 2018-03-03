if !executable('gdb')
  let g:plugin_conque_gdb_loaded = 1
  finish
endif

cnoreabbr gdb ConqueGdb

let g:ConqueTerm_StartMessages = 0

