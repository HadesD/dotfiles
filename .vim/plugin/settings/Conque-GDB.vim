if !executable('gdb') || has('win32unix')
  let g:plugin_conque_gdb_loaded = 1
  let g:ConqueGdb_Disable = 1
  let g:autoload_conque_gdb_loaded = 1
  finish
endif

cnoreabbr gdb ConqueGdb

let g:ConqueTerm_StartMessages = 0

