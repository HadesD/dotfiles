map <C-m> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden          = 1
let g:NERDTreeShowIgnoredStatus = 1

if &encoding != "utf-8"
  let g:NERDTreeDirArrows = 0

  if has("unix")
    let s:nerdtree_path = g:dot_vim_dir . '/pack/plugins/start/nerdtree'
    let s:checkout = system("cd " . s:nerdtree_path . " && git apply --stat " . s:nerdtree_path . "/../../../../patches/fix_error_utf8_encoding.patch")
  end
end

