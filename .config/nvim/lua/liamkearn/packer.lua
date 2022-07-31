return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'sainnhe/gruvbox-material'
  use 'nvim-telescope/telescope.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'dag/vim-fish'
  use 'nvim-lua/plenary.nvim'
end)
