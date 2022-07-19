vim.cmd([[
set number
set relativenumber
set nu

" Cursor
set guicursor=n-v-c-i-sm:block

" Search
set nohlsearch

" Misc
set noerrorbells
set nowrap
set updatetime=50
set scrolloff=18

" Spacing
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

nnoremap <SPACE> <Nop>
let mapleader = " "

" Disable arrow keys for learning
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

call plug#begin()

Plug 'sainnhe/gruvbox-material'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'dag/vim-fish'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material

 nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep     for > ")})<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]])

