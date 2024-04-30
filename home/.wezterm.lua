local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = "AdventureTime"

-- 背景透過
config.window_background_opacity = 0.85

return config
