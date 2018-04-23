if filereadable(getcwd() . '/compile_commands.json')
  finish
endif

if !filereadable(getcwd() . '/CMakeLists.txt')
  finish
endif

if !filereadable(getcwd() . '/build/compile_commands.json')
  finish
endif

echom "Compile"

call Symlink(getcwd() . '/build/compile_commands.json', getcwd())

