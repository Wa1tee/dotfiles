
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  	enable_autosnippets = true,


  -- Use Tab (or some other key if you prefer) to trigger visual selection
  --store_selection_keys = "<Tab>",

    update_events = 'TextChanged,TextChangedI',
})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

--Keymaps
vim.cmd([[
	" Expand or jump in insert mode
	imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'

	" Jump forward through tabstops in visual mode
	smap <silent><expr> <c-k> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<c-k>'

	" Jump backward through snippet tabstops with Shift-Tab (for example)
	imap <silent><expr> <c-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<c-j>'
	smap <silent><expr> <c-j> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<c-j>'
]])
