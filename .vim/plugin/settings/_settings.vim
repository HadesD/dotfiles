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
set dir=~/tmp
set autoread
set autowrite
set laststatus=2 " Always show airline
set ttimeoutlen=50
set wildmenu
set lazyredraw
set showmatch

" backup
set backup
if has('unix')
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set backupskip=/tmp/*,/private/tmp/*
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
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
