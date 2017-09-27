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
set undodir-=.
if has('unix')
  set backupdir^=/tmp
  set undodir^=~/tmp,/tmp
elseif has('win32') || has('win64')
  set backupdir^=$TEMP
  set undodir^=$TEMP
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
