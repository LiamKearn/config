return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>fq', function () require("telescope.builtin").diagnostics() end },
        { '<leader>fk', function () require("telescope.builtin").keymaps() end },
        { '<leader>fg', function () require("telescope.builtin").live_grep() end },
        { '<leader>fm', function () require('telescope.builtin').man_pages() end },
        { '<leader>fs', function () require('telescope.builtin').lsp_document_symbols() end },
        { '<leader>FS', function () require('telescope.builtin').lsp_dynamic_workspace_symbols() end },
        { '<leader>fr', function () require('telescope.builtin').resume() end }
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

