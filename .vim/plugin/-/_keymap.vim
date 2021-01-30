nnoremap <F6> :set invpaste paste?<CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
set pastetoggle=<F6>
" set nopaste
" set showmode

" --- Quit all faster ---
abbreviate qq qa

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

