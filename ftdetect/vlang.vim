au BufNewFile,BufRead *.v set filetype=vlang
" Currently used in some directories in the compiler
au BufNewFile,BufRead *.vv set filetype=vlang
" Support for v scripts
au BufNewFile,BufRead *.vsh set filetype=vlang


au BufNewFile,BufRead *.mod {
  if expand('%:t') == 'v.mod'
    set filetype=vmod
  endif
}
