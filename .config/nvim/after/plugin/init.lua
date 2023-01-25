require('oil').setup({
    view_options = {
        show_hidden = true,
    }
})

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {},
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

