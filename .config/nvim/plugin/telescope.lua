local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
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
})

vim.keymap.set('n', '<leader>fq', builtin.diagnostics)
vim.keymap.set('n', '<leader>fk', builtin.keymaps)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fm', builtin.man_pages)
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>FS', builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>fr', builtin.resume)

