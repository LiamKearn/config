require('oil').setup({
    view_options = {
        show_hidden = true,
    }
})

require('telescope').setup{
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

