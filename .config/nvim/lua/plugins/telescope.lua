return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>fq', '<cmd>lua require("telescope.builtin").diagnostics()<cr>' },
        { '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>' },
        { '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical"})<cr>' },
        { '<leader>fm', '<cmd>lua require("telescope.builtin").man_pages()<cr>' },
        { '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>' },
        { '<leader>FS', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>' },
        { '<leader>fr', '<cmd>lua require("telescope.builtin").resume()<cr>' }
    },
    opts = {
        defaults = {
            layout_strategies = 'vertical',
            layout_config = {
                vertical = {
                    prompt_position = "top",
                    mirror = true,
                },
            },
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case'
            },
            file_ignore_patterns = {
                '.git'
            },
        },
        pickers = {
            find_files = {
                find_command = {
                    'fd',
                    '--type',
                    'f',
                    '--no-ignore-vcs',
                    '--color=never',
                    '--hidden',
                    '--follow',
                }
            }
        },
    }
}

