if &encoding != "utf-8" || v:version < 703
  let g:loaded_webdevicons = 1
  let g:webdevicons_enable = 0
  let g:webdevicons_enable_nerdtree = 0
  finish
endif

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

