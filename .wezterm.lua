-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("Fira Code Nerd Font", { weight = "DemiBold" })
config.font_size = 10.5
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
		"#7f7f7f", -- bright black
		"#ff0000", -- bright red
		"#00ff00", -- bright green
		"#ffff00", -- bright yellow
		"#5c5cff", -- bright blue
		"#ff00ff", -- bright magenta
		"#00ffff", -- bright cyan
		"#ffffff", -- bright white
	},
}

-- and finally, return the configuration to wezterm
return config
