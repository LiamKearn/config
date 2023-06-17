local wezterm = require 'wezterm'
local act = wezterm.action

return {
    {
        key = 'e',
        mods = 'CTRL',
        action = act.SendString '\x05',
    },
    {
        key = 'k',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = 'L', mods = 'CTRL' },
            act.ScrollToBottom,
        }
    },
    {
        key = 'k',
        mods = 'CMD|SHIFT',
        action = act.Multiple {
            act.ClearScrollback 'ScrollbackAndViewport',
            act.SendKey { key = 'L', mods = 'CTRL' },
            act.ScrollToBottom,
            act.EmitEvent 'scollback-cleared'
        }
    },
    {
        key = 'l',
        mods = 'CMD',
        action = act.ActivateLastTab,
    },
    {
        key = 'p',
        mods = 'CMD',
        action = act.ActivateCommandPalette,
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = act.MoveTabRelative(-1)
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = act.MoveTabRelative(1)
    },
    {
        key = 'R',
        mods = 'CTRL|SHIFT',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, _, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
    {
        key = 'B',
        mods = 'CMD|SHIFT',
        action = act.EmitEvent('toggle-background-opaque'),
    },
}
