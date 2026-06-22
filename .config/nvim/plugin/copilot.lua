require('copilot').setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
            accept_line = '<C-e>',
            accept_word = '<C-s>',
        },
    },
    filetypes = {
        ["*"] = true,
    },
})
