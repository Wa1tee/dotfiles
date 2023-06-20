set encoding=utf-8
call plug#begin()
    Plug 'kovisoft/paredit'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'godlygeek/tabular'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'machakann/vim-highlightedyank'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'nathanaelkane/vim-indent-guides'
    "
    " Python specific
    Plug 'tmhedberg/SimpylFold'
    Plug 'nvie/vim-flake8'
    "
    " C++ specific
    Plug 'majutsushi/tagbar'
    " CSV
    Plug 'chrisbra/csv.vim'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme monokai_pro

set termguicolors

filetype plugin on
syntax on

set number
set relativenumber
set cursorline

set ruler

" Folds
set foldcolumn=1
set foldmethod=manual

" set relativenumber
" line numbers
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab
set scrolloff=10
set softtabstop=4
set mouse=a

let mapleader=','

let python_hilight_all = 1

set nocompatible
set nowrap
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set incsearch
set mouse=a
set history=1000

set t_RV=

"set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest

"set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest



" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \}
set laststatus=2


" Enable folding
" set foldmethod=indent
" set foldlevel=99

" Enable folding with spacebar
" nnoremap <space> za

" Ignore unnecessary files in nerdtree
let NERDTreeIgnore=['\.png$']

""""""""""" Custom keymaps """"""""""""""""""""""""

" Visualize tabs
set listchars=tab:▷▷
set invlist
noremap <Leader><Leader><Tab> :set invlist<CR>

" yank full path to current file into the system clipboard *
noremap <silent> <Leader><Leader>p :let @* =expand("%:p")<CR>1<c-g>

" Toggle NERDTree with ctrl+n
map <C-n> :NERDTreeToggle<CR>

nmap <leader><leader>v :source $MYVIMRC<CR>
nmap <s-Y> y$
nmap <s-D> d$

" Use ,/ to search using visual selection
vnoremap <leader>/ y/<C-R>"<CR>N
"
" Highlight lines exceeding 80 chars
" Toggle using <leader><leader>h

hi MaybeOverLength ctermbg=red ctermfg=white guibg=#592929
hi link MaybeOverLength NONE
match MaybeOverLength /\%121v.\+/

let s:activatedh = 1
function! ToggleH()
    if s:activatedh == 1
        let s:activatedh = 0
        hi link MaybeOverLength OverLength
    else
        let s:activatedh = 1
        hi link MaybeOverLength NONE
    endif
endfunction

nnoremap <leader><leader>h :call ToggleH()<CR>

" Trailing whitespace hilight toggle
nnoremap <leader><leader>w :ToggleWhitespace<CR>
