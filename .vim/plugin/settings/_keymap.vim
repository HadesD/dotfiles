map <F2> :retab <CR> :w <CR>

set pastetoggle=<F3>
set nopaste

" --- Quit all faster ---
" cnoreabbrev qq qa
abbreviate qq qa

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
