function! _runtime#init(...) abort
  if has('unix')
    set rtp+=$HOME/.vim/autoload/vim-pathogen
  elseif (has('win32') || has('win64')) && !has('win32unix')
    set rtp+=$VIMRUNTIME/../vim80/autoload/vim-pathogen
  end
  execute pathogen#infect()
endfunction
