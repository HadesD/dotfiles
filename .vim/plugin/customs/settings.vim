" backup
set backup
set backupdir-=.
set dir-=.
if (v:version > 703)
  set undodir-=.
endif
if has('unix')
  set backupdir^=/tmp
  if (v:version > 703)
    set undodir^=/tmp
    set undofile
  endif
elseif has('win32') || has('win64')
  set backupdir^=$TEMP
  if (v:version > 703)
    set undodir^=$TEMP
  endif
endif
set writebackup

