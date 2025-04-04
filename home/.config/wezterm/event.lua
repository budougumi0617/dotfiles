local wezterm = require("wezterm")

wezterm.on("toggle-font-size", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  overrides.font_size = not overrides.font_size and 15.0 or nil

  window:set_config_overrides(overrides)
end)
