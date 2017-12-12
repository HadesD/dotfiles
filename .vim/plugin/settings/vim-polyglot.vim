let g:polyglot_disabled = ['cpp']

if (v:version < 702)
  g:polyglot_disabled = add(g:polyglot_disabled, 'julia')
endif
