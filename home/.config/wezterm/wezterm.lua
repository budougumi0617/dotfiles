-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 15.0

config.window_frame = {
	font = wezterm.font("Roboto"),
	font_size = 8.0,
}

-- keybinds
-- diable default keybinds
config.disable_default_key_bindings = true
local keybind = require("keybinds")
config.keys = keybind.keys
config.key_tables = keybind.key_tables
config.leader = { key = ",", mods = "CTRL", timeout_milliseconds = 2000 }

return config
