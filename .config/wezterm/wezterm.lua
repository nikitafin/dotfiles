local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- config.color_scheme = '3024 Day (Gogh)'
-- config.color_scheme = '3024 Night (Gogh)'

-- Good Old Days
-- config.color_scheme = 'Borland (Gogh)'
-- config.color_scheme = 'Windows 95 (base16)'
config.color_scheme = 'Windows 95 Light (base16)'

-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "RESIZE"
config.default_cursor_style = 'BlinkingUnderline'
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

return config
