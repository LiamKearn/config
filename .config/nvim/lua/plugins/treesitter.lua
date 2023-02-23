return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        playground = {
            enable = false,
            disable = {},
            updatetime = 25
        },
        ensure_installed = {
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
            'vue'
        }
    },
    init = function()
        vim.filetype.add({
            extension = {
                ss = 'html'
            }
        })
    end,
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
