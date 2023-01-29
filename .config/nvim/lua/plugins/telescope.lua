return {
    'nvim-telescope/telescope.nvim',
    config = {
        defaults = {
            file_ignore_patterns = {
                ".git"
            },
        },
        pickers = {
            find_files = {
                hidden = true
            }
        }
    }
}
