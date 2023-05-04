return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
            theme = 'catppuccin',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'diagnostics'},
            lualine_c = {'filename'},
            lualine_y = {},
            lualine_x = {'encoding', 'filetype'},
            lualine_z = {'location'}
        }
    }
}
