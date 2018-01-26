set pastetoggle=<F3>
set nopaste

" --- Quit all faster ---
" cnoreabbrev qq qa
abbreviate qq qa

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" " $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

abbreviate terminal term ++curwin

abbreviate qqb CloseHiddenBuffers

nmap <BS> <C-W>h

