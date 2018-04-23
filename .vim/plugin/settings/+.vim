function! Symlink(target_path, link_path) abort
  if has('unix')
    let s:cmd = 'ln -s ' . a:target_path . ' ' . a:link_path
  elseif has('win32') || has('win64')
    let s:cmd = 'copy ' . a:target_path . ' ' . a:link_path
  endif

  if exists('s:cmd')
    if exists(':AsyncRun')
      silent exe 'AsyncRun ' s:cmd
    else
      let run = system(s:cmd)
    end
  end
endfunction

