set encoding=utf-8

call plug#begin()
  Plug 'phanviet/vim-monokai-pro'
  Plug 'loctvl842/monokai-pro.nvim'

  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree'
  Plug 'godlygeek/tabular'
  Plug 'numToStr/Comment.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  Plug 'vimwiki/vimwiki'

  " Plug 'nvim-neorg/neorg'
  
  Plug 'ahmedkhalf/project.nvim'

  " Plug 'hari-rangarajan/CCTree/'
  " Plug 'yegappan/taglist'
  " Plug 'dhananjaylatkar/cscope_maps.nvim'

  Plug 'aaditeynair/conduct.nvim'
  Plug 'gcmt/taboo.vim'

  " CSV
  Plug 'chrisbra/csv.vim'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'rbong/vim-flog'
  Plug 'APZelos/blamer.nvim'

  "LSP setup
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'mfussenegger/nvim-dap'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

	"Distraction free stuff
  "Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

  Plug 'machakann/vim-highlightedyank'
  Plug 'mbbill/undotree'

  "Statuslines
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'koenverburg/minimal-tabline.nvim'

  " Plug 'funorpain/vim-cpplint'
  " Plug 'rsaraf/vim-advanced-lint'

  "Plug 'rmagatti/auto-session'

  Plug 'NMAC427/guess-indent.nvim'

  Plug 'LunarWatcher/auto-pairs'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'rr-/vim-hexdec'

  Plug 'ggandor/leap.nvim'

  Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'}
call plug#end()


colorscheme monokai_pro
" colorscheme monokai-pro
set termguicolors

set nocompatible
filetype plugin on
syntax on

" Folds
set foldcolumn=1
set foldmethod=manual
" set foldmethod=expnr
" set foldexpr=nvim_treesitter#foldexpr()
" autocmd BufReadPost,FileReadPost * normal zR

source ~/.config/nvim/vimfiles/lintrules.vim
" source ~/.config/nvim/ftdetect/c.vim

let mapleader = ","

map <C-n> :NERDTreeToggle<CR>

" Reload the main config
nmap <leader><leader>v :source $MYVIMRC<CR>
" Reload snippets files
nmap <leader><leader>s :source ~/.config/nvim/luafiles/luasnip.lua<CR>

" Use // to search using visual selection
vnoremap <leader>/ y/<C-R>"<CR>N

set scrolloff=15
set mouse=a
set smartcase
set number
set relativenumber
set cursorline

" Tabs to be 4 wide and turned into spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Command line two symbols high
set cmdheight=1
" idle timeout write to swap
set updatetime=300
" Ignore case in a pattern
set ignorecase

" autocmd BufRead *.c map <F7> :w<enter>:!cpplint %<CR>
set sessionoptions+=tabpages,globals


" luafile ~/.config/nvim/luafiles/general.lua
luafile ~/.config/nvim/luafiles/luasnip.lua
luafile ~/.config/nvim/luafiles/comment.lua

luafile ~/.config/nvim/luafiles/lualine.lua
"luafile ~/.config/nvim/luafiles/tabline.lua
luafile ~/.config/nvim/luafiles/treesitter.lua
luafile ~/.config/nvim/luafiles/telescope.lua
"luafile ~/.config/nvim/gitsigns.lua
luafile ~/.config/nvim/luafiles/project.lua

luafile ~/.config/nvim/luafiles/mason.lua
luafile ~/.config/nvim/luafiles/leap.lua

luafile ~/.config/nvim/luafiles/lsp.lua
" luafile ~/.config/nvim/luafiles/guess.lua
luafile ~/.config/nvim/luafiles/indent.lua
" luafile ~/.config/nvim/luafiles/neorg.lua
luafile ~/.config/nvim/luafiles/colorschemes.lua

luafile ~/.config/nvim/luafiles/conduct.lua

" source ~/.config/nvim/vimfiles/cctree.vim

source ~/.config/nvim/vimfiles/vimwiki.vim
source ~/.config/nvim/vimfiles/projects.vim

" Visualize tabs
set listchars=tab:▷▷
set invlist
noremap <Leader><Leader><Tab> :set invlist<CR>

" yank full path to current file into the system clipboard *
noremap <silent> <Leader><Leader>p :let @* =expand("%:p")<CR>1<c-g>

" :%s/search/replace/ without the g-flag in the end
set nogdefault
set gdefault
