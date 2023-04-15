local wezterm = require 'wezterm'

local function get_tab_title(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
        return title
    end

    local pane = tab_info.active_pane
    if pane ~= nil then
        local foreground_process = pane.foreground_process_name
        if foreground_process == nil then
            foreground_process = 'Unknown'
        end
        -- 'basename': https://wezfurlong.org/wezterm/config/lua/pane/get_foreground_process_name.html
        local tab_title = string.gsub(foreground_process, '(.*[/\\])(.*)', '%2')
        return tab_title
    end

    return 'Unknown'
end

local function trim_tab_title(config, index, tab_title)
    local max_name_width = config.tab_max_width - 1 - string.len(tostring(index))
    return string.sub(tab_title, 1, max_name_width)
end

wezterm.on(
    'format-tab-title',
    function(tab_info, _, _, config, _, _)
        local built_title = {}

        -- One index plus a separator. EG> '1:', '2:', '3:', etc.
        local one_indexed = tab_info.tab_index + 1
        table.insert(built_title, { Text = tostring(one_indexed) .. ':' })

        -- The custom tab title or the foreground process name.
        local tab_title = get_tab_title(tab_info)

        -- Trim the tab title to fit the tab width and accommodate the active
        -- and last tab indicators.
        local trimmed_name = trim_tab_title(config, one_indexed, tab_title)
        table.insert(built_title, { Text = trimmed_name })

        -- Add any indicators or a whitespace to stop shifting.
        if tab_info.is_active then
            table.insert(built_title, { Attribute = { Intensity = 'Bold' } })
            table.insert(built_title, { Text = '*' })
        else
            table.insert(built_title, { Text = ' ' })
        end

        -- Padding.
        table.insert(built_title, { Text = ' ' })

        return wezterm.format(built_title)
    end
)
