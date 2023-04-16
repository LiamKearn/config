return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept_line = '<C-e>',
                accept_word = '<C-s>',
            },
        },
        filetypes = {
            ["*"] = true,
        },
    },
}
