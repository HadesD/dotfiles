map <F2> :retab <CR> :w <CR>

set pastetoggle=<F3>
set nopaste

" --- Quit all faster ---
" cnoreabbrev qq qa
abbreviate qq qa

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
nnoremap <leader><space> :nohlsearch<CR> " \<space>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" " $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" This one is pretty cool. It visually selects the block of characters you
" added last time you were in INSERT mode.
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
