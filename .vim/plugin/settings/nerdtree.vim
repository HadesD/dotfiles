map <C-m> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden          = 1
let g:NERDTreeShowIgnoredStatus = 1

if &encoding != "utf-8"
  let g:NERDTreeDirArrows         = 0
end

if has("unix")
  if v:version < 703
    let s:checkout = system("cd ~/.vim/bundle/nerdtree && git checkout 4.1.0")
  end
end
