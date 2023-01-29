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
    use 'ray-x/lsp_signature.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'simrat39/inlay-hints.nvim'

    -- Debugging.
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Editing PList files.
    use 'darfink/vim-plist'

    -- Git, I prefer to work in lazygit and just have blame in the browser.
    use 'ruanyl/vim-gh-line'

    use 'stevearc/oil.nvim'

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use ("nvim-treesitter/playground", {
        run = ":TSInstall query"
    })
end)
