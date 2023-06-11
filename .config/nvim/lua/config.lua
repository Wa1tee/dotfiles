vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local call = vim.call
local cmd = vim.cmd
local Plug = vim.fn['plug#']

call('plug#begin', PATH)
    Plug 'kovisoft/paredit'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'tomtom/tlib_vim'
    Plug 'MarcWeber/vim-addon-mw-utils'
    --Plug 'scrooloose/nerdtree'
    Plug 'nvim-tree/nvim-web-devicons' -- optional, for file icons
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'scrooloose/nerdcommenter'
    Plug 'godlygeek/tabular'
    Plug 'ervandew/supertab'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Shougo/vimproc.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'Raimondi/delimitMate'
    Plug 'tmhedberg/SimpylFold'
    Plug 'nvie/vim-flake8'
    --Plug 'lervag/vimtex' 
    --Plug 'tanvirtin/monokai.nvim'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'akinsho/bufferline.nvim'
    Plug 'sheerun/vim-polyglot'
    --Plug 'nvim-treesitter/nvim-treesitter'
call'plug#end'

cmd('colorscheme monokai_pro')


vim.opt.termguicolors   = true
vim.opt.mouse           = 'a'
vim.opt.ignorecase      = true
vim.opt.smartcase       = true
vim.opt.hlsearch        = false
vim.opt.wrap            = true
vim.opt.breakindent     = true
vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4
vim.opt.expandtab       = true
vim.opt.number          = true

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  actions = {
    open_file = {
        window_picker = {
            enable = false,
        }
    }
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<cr>')

-- blankline
vim.opt.list = true
--vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
}

require("bufferline").setup{}


