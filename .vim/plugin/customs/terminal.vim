if has('terminal')
"if v:version >= 800
  tnoremap <Esc> <C-W>N
  tnoremap <Esc><Esc> <C-W>N
  set timeout timeoutlen=1000  " Default
  set ttimeout ttimeoutlen=100  " Set by defaults.vim

  command! CTerm :term ++curwin
  command! HTerm :split | :wincmd j | :enew | :CTerm
  command! VTerm :vsplit | :wincmd l | :enew | :CTerm
  command! Term :HTerm
end
