au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
	execute ":Calendar"
	if exists("g:calendar_open")
		if g:calendar_open == 1
			execute "q"
			unlet g:calendar_open
		else
			g:calendar_open = 1
		end
	else
		let g:calendar_open = 1
	end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()

noremap <leader><leader>d :VimwikiDiaryIndex<CR>

noremap <leader>gd :VimwikiDiaryGenerateLinks<CR>
noremap <leader>gl :VimwikiGenerateLinks<CR>
