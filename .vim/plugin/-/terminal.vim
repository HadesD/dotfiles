tnoremap <Esc> <C-W>N
tnoremap <Esc><Esc> <C-W>N
set timeout timeoutlen=1000  " Default
set ttimeout ttimeoutlen=100  " Set by defaults.vim

command Term :term ++curwin
command HTerm :split | :wincmd j | :enew | :Term
command VTerm :vsplit | :wincmd l | :enew | :Term
