function! floaterm#wrapper#fzy#(cmd, jobopts, config) abort
  let s:fzy_tmpfile = tempname()
  let cmd = 'find . -type f '
  let cmd .= join([
        \ "! -path */.git/*",
        \ "! -path */.bundle/*",
        \ "! -path */.cache/*",
        \ "! -path */python2.7/*",
        \ "! -path */python3.6/*",
        \ "! -path */__pycache__/*",
        \ "! -path */node_modules/*",
        \ ], ' ')
  let cmd .= ' | fzy > ' . s:fzy_tmpfile
  let cmd = [&shell, &shellcmdflag, cmd]
  let jobopts = {'on_exit': funcref('s:fzy_callback')}
  call floaterm#util#deep_extend(a:jobopts, jobopts)
  return [v:false, cmd]
endfunction

function! s:fzy_callback(job, data, event, opener) abort
  if filereadable(s:fzy_tmpfile)
    let filenames = readfile(s:fzy_tmpfile)
    if !empty(filenames)
      if has('nvim')
        call floaterm#window#hide(bufnr('%'))
      endif
      let locations = []
      for filename in filenames
        let dict = {'filename': fnamemodify(filename, ':p')}
        call add(locations, dict)
      endfor
      call floaterm#util#open(locations, a:opener)
    endif
  endif
endfunction
