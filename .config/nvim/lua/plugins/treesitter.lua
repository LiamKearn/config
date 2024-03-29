return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>",      desc = "Schrink selection",  mode = "x" },
    },
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
            'vue'
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<nop>",
                node_decremental = "<bs>",
            },
        },
        textobjects = {
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]p"] = "@parameter.inner",
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[p"] = "@parameter.inner",
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
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
