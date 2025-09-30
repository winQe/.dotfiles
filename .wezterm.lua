-- Pull in the wezterm API
local wezterm = require("wezterm")

wezterm.on("format-window-title", function()
  local title = "WezTerm"
  -- some logic here
  return title
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" })
config.font_size = 13.0
config.enable_tab_bar = false

config.colors = {
  foreground = "#e5e5e5",
  background = "#1a1a24",
  cursor_bg = "#e5e5e5",
  cursor_border = "#e5e5e5",
  cursor_fg = "#000000",
  selection_bg = "#5155e1",
  selection_fg = "#000000",

  ansi = {
    "#1a1a24", -- black
    "#cd0000", -- red
    "#f57900", -- green
    "#ff00a8", -- yellow
    "#5155e1", -- blue
    "#cd00cd", -- magenta
    "#00cdcd", -- cyan
    "#e5e5e5", -- white
  },

  brights = {
    "#4c4f69", -- bright black
    "#d20f39", -- bright red
    "#40a02b", -- bright green
    "#df8e1d", -- bright yellow
    "#1e66f5", -- bright blue
    "#f5c2e7", -- bright magenta
    "#04a5e5", -- bright cyan
    "#eff1f5", -- bright white
  },
}
config.window_padding = {
  left = 2,
  right = 0,
  top = 0,
  bottom = 0,
}
-- and finally, return the configuration to wezterm
return config
