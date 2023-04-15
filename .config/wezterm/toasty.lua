local wezterm = require 'wezterm'

wezterm.on('scollback-cleared', function(window, _)
  window:toast_notification('wezterm', 'scrollback buffer cleared', nil, 200)
end)

