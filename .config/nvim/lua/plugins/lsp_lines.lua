return {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    keys = {
        { '<Leader>m', function()
            local next_text = not vim.diagnostic.config().virtual_text
            local next_lines = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_text = next_text, virtual_lines = next_lines })
        end, desc = 'Toggle LSP lines' }
    },
    init = function()
        require('lsp_lines').setup()
        vim.diagnostic.config({ virtual_lines = false })
    end
}
