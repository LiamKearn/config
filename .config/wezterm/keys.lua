local wezterm = require 'wezterm'
local act = wezterm.action

return {
    {
        key = 'k',
        mods = 'CMD',
        action = act.Multiple {
            act.ClearScrollback 'ScrollbackAndViewport',
            act.SendKey { key = 'L', mods = 'CTRL' },
        }
    },
    {
        key = 'e',
        mods = 'CTRL',
        action = wezterm.action.SendString '\x05',
    },
}
