" Highlight lines exceeding 80 chars
" Toggle using <leader><leader>h

hi OverLength ctermbg=red ctermfg=white guibg=#592929
hi link MaybeOverLength NONE
match MaybeOverLength /\%121v.\+/

let s:activatedh = 0
function! ToggleH()
    if s:activatedh == 0
        let s:activatedh = 1
        hi link MaybeOverLength OverLength
    else
        let s:activatedh = 0
        hi link MaybeOverLength NONE
    endif
endfunction

nnoremap <leader><leader>h :call ToggleH()<CR>

" Trailing whitespace hilight toggle
nnoremap <leader><leader>w :ToggleWhitespace<CR>
