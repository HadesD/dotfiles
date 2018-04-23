if filereadable(getcwd() . '/compile_commands.json')
  finish
endif

if !filereadable(getcwd() . '/CMakeLists.json')
  finish
endif

if !filereadable(getcwd() . '/build/compile_commands.json')
  finish
endif

call Symlink(getcwd() . '/build/compile_commands.json', getcwd())

