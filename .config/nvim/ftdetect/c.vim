"C settings and filetype detection

au BufRead,BufNewFile *.c.*,*.h.*     call dist#ft#FTlpc()

" check ~/.config/nvim/vimfiles/lintrules.vim
hi link MaybeOverLength NONE
