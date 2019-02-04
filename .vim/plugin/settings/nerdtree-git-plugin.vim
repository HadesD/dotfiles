let g:NERDTreeShowIgnoredStatus = 0

if &encoding != "utf-8"
  if has("unix")
    let s:plugin_path = g:dot_vim_dir . '/pack/plugins/start/nerdtree'
    let s:checkout = system("cd " . s:plugin_path . " && git apply --stat " . s:plugin_path . "/../../../../patches/nerdtree-git-plugin.fix_error_utf8_encoding.patch")
  end
end


