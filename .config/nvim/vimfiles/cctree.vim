let g:CCTreeRecursiveDepth=10
let g:CCTreeMinVisibleDepth=3

" Enable Tlist toggle with F8
nnoremap <silent> <F8> :TlistToggle<CR>
" autocmd VimEnter * if filereadable('cscope.out') | exec "CCTreeLoadDB 'cscope.out'" | endif
function! LoadCCTree()
    if filereadable('cscope.out')
        CCTreeLoadDB cscope.out
    endif
endfunc
autocmd VimEnter * call LoadCCTree()
