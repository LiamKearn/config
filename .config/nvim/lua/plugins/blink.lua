return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        keymap = { preset = 'default' },
        completion = { list = { selection = { preselect = false } } },
        signature = {
            enabled = true,
            window = { show_documentation = true },
        },
    },
}
