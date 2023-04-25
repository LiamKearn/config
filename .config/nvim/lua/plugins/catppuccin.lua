return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    build = ':CatppuccinCompile',
    opts = {
        flavour = 'macchiato',
        background = {
            light = 'latte',
            dark = 'macchiato',
        },
        transparent_background = true,
        compile = {
            enabled = true,
            path = vim.fn.stdpath('cache') .. '/catppuccin'
        },
        integrations = {
            dap = {
                enabled = true,
                enable_ui = true,
            },
            cmp = true,
            telescope = true,
        },
        no_italic = true,
    },
}
