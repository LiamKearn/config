local wezterm = require 'wezterm'

wezterm.on('toggle-background-opaque', function(window, _)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity ~= 1 then
        overrides.window_background_opacity = 1
    else
        overrides.window_background_opacity = 0.85
    end
    window:set_config_overrides(overrides)
end)
