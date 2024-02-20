
" Visualize tabs
set listchars=tab:▷▷
set invlist
noremap <Leader><Leader><Tab> :set invlist<CR>

" yank full path to current file into the system clipboard *
noremap <silent> <Leader><Leader>p :let @* =expand("%:p")<CR>1<c-g>
