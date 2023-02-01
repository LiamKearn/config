return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    opts = {
        defaults = {
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
        }
    }
}

