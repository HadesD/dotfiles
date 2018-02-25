set nocompatible
set backspace=2
set modifiable
set number
set incsearch        " Search on typing
set hlsearch         " Highlight search
set showcmd
set cindent
set nowb
set swapfile
set cursorline
set autoread
set autowrite
set laststatus=2 " Always show airline
set ttimeoutlen=50
set wildmenu
set lazyredraw
set showmatch

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
    set undodir^=~/tmp,/tmp
  endif
elseif has('win32') || has('win64')
  set backupdir^=$TEMP
  if (v:version > 703)
    set undodir^=$TEMP
  endif
endif
set writebackup

" --- Code Style ---
" set softtabstop = 0
set expandtab
set tabstop=4
set smartindent
set autoindent
set shiftwidth=2
set softtabstop=4

" FOLD -- cLOSE/oPen on file
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

