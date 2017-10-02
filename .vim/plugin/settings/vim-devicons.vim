let g:NERDTreeLimitedSyntax = 1

if ((&encoding != "utf-8") || (v:version < 703) || g:is_ssh == 1 || has('win32unix') || has('win32') || has('win64'))
  let g:webdevicons_enable = 0
  let g:webdevicons_enable_unite = 0
  let g:loaded_webdevicons = 1
  let g:webdevicons_enable_nerdtree = 0
  let g:NERDTreeSyntaxDisableDefaultExtensions = 1
  finish
endif

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

