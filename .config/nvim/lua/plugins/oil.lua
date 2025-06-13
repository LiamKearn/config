return {
    'stevearc/oil.nvim',
    lazy = false,
    keys = {
        { '<Leader>ee', function() require('oil').open() end, desc = 'Open Oil' }
    },
    opts = {
        view_options = {
            show_hidden = true,
        }
    }
}
