function! _runtime#init(...) abort
  if has('unix')
    let s:dot_vim = $HOME.'/.vim'
  elseif (has('win32') || has('win64')) && !has('win32unix')
    let s:dot_vim = $HOME.'/vimfiles'
	set enc=utf-8
  end
  if (exists('s:dot_vim'))
    let &rtp = &rtp.','.s:dot_vim.'/autoload/vim-pathogen'
  endif
  execute pathogen#infect()
endfunction
