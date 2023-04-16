local wezterm = require 'wezterm';

return function(window)
    local act = window:active_tab()
    local current_tab_id = act.tab_id(act)

    wezterm.GLOBAL.tab_state = wezterm.GLOBAL.tab_state or {}

    if wezterm.GLOBAL.tab_state.current_tab_id == nil then
        wezterm.GLOBAL.tab_state.current_tab_id = current_tab_id
        wezterm.GLOBAL.tab_state.last_tab_id = nil
    end

    if wezterm.GLOBAL.tab_state.current_tab_id ~= current_tab_id then
        wezterm.GLOBAL.tab_state.last_tab_id = wezterm.GLOBAL.tab_state.current_tab_id
        wezterm.GLOBAL.tab_state.current_tab_id = current_tab_id
    end
end
