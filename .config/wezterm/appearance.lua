local wezterm = require 'wezterm'
local appearance = {}

function appearance.fonts(config)
    config.font = wezterm.font('Comic Code Ligatures', { weight = 'Regular' })
    -- config.font = wezterm.font('SauceCodePro Nerd Font Mono', { weight = 'Regular' })
    config.font_size = 21
end

function appearance.colors(config)
    config.color_scheme = 'Adventure'
end

function appearance.apply(config)
    appearance.fonts(config)
    appearance.colors(config)
end

return appearance
