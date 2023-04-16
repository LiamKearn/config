local wezterm = require 'wezterm';

wezterm.on('update-status', function(window, _)
    require('status-hooks/last-tab')(window)
end);
