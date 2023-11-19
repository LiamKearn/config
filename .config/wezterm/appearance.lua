local wezterm = require 'wezterm'

local function fonts(config)
    config.font = wezterm.font_with_fallback({
        -- { family = 'Comic Code Ligatures', weight = 'Medium' },
        { family = 'Berkeley Mono Variable', weight = 'Regular' },
        { family = 'FiraCode Nerd Font Mono', weight = 'Medium' },
    })
    config.font_size = 23
end

local function colors(config)
    config.color_scheme = 'Adventure'
    config.colors = {
        tab_bar = {
            background = '#000000',

            active_tab = {
                bg_color = '#000000',
                fg_color = '#ffffff',
                intensity = 'Bold',
                underline = 'None',
                italic = false,
                strikethrough = false,
            },
            inactive_tab = {
                bg_color = '#000000',
                fg_color = '#cccccc',
                intensity = 'Normal',
                underline = 'None',
                italic = false,
                strikethrough = false,
            },
            inactive_tab_hover = {
                bg_color = '#000000',
                fg_color = '#ffffff',
            },
        },
    }
end


local function apply(config)
    fonts(config)
    colors(config)
end

return apply
