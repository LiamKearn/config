local oil = require('oil')

oil.setup({
    view_options = {
        show_hidden = true,
    }
})

vim.keymap.set('n', '<Leader>ee', oil.open, { silent = true })
