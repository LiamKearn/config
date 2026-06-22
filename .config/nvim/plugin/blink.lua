require('blink.cmp').setup({
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    keymap = { preset = 'default' },
    completion = { list = { selection = { preselect = false } } },
    signature = {
        enabled = true,
        window = { show_documentation = true },
    },
})
