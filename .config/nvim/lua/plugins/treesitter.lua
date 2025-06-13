return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>",      desc = "Schrink selection",  mode = "x" },
    },
    opts = {
        indent = { enable = true },
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
        incremental_selection = {
            enable = true,
            keymaps = {
                scope_incremental = false,
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                node_decremental = "<bs>",
            }
        }
    }
}
