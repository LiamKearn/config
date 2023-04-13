local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.keys = require 'keys'
config.ssh_domains = require 'domains'

config.color_scheme = 'Gruvbox Material (Gogh)'
config.font = wezterm.font 'SauceCodePro Nerd Font Mono'
config.font_size = 21
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true

-- TODO remove window padding when VIM is launched (or an application paints a
-- background) then config that application to use it's own internal padding.
-- config.window_padding = {
--   left = 0,
--   right = 0,
--   top = 0,
--   bottom = 0,
-- }

return config
