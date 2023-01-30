return {
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = {
            file_ignore_patterns = {
                '.git'
            },
        },
        pickers = {
            find_files = {
                hidden = true
            }
        }
    }
}
