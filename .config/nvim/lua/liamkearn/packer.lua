return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'sainnhe/gruvbox-material'
    use 'nvim-telescope/telescope.nvim'
    use 'dag/vim-fish'
    use 'nvim-lua/plenary.nvim'

    -- todo Ergonomics.
    use 'gaoDean/autolist.nvim'

    -- Language support stuff.
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use ("nvim-treesitter/playground", {
        run = ":TSInstall query"
    })
end)
