local wezterm = require 'wezterm'
local config = wezterm.config_builder()

require('appearance')(config)
require('domains')(config)
require 'status-loop'
require 'tabs'
require 'toasty'
require 'listeners'

config.keys = require 'keys'

config.window_background_opacity = 1.00
config.native_macos_fullscreen_mode = true
config.window_decorations = 'RESIZE'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

return config
