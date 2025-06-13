return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>",      desc = "Schrink selection",  mode = "x" },
    },
    config = function()
        --- @diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            indent = { enable = true },
            highlight = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                }
            },
            ensure_installed = {
                'bibtex',
                'cmake',
                'c',
                'make',
                'lua',
                'cpp',
                'rust',
                'gitcommit',
                'go',
                'fish',
                'dockerfile',
                'php',
                'yaml',
                'html',
                'javascript',
                'typescript',
                'markdown',
                'json',
                'json5',
                'vue',
            },
        })
    end,
}
