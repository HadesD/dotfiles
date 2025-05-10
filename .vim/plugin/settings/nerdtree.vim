"finish

nnoremap <C-m> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

let g:NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

if &encoding != "utf-8"
  let g:NERDTreeDirArrows = 0

  if has("unix")
    let s:plugin_path = g:dot_vim_dir . '/pack/plugins/start/nerdtree'
    let s:checkout = system("cd " . s:plugin_path . " && git apply --stat " . s:plugin_path . "/../../../../patches/nerdtree.fix_error_utf8_encoding.patch")
  end
end

