local wezterm = require("wezterm")

local hostname = wezterm.hostname()

return {
	default_prog = { --[[dotfile-manager--]]
	},
	font = wezterm.font("Hack Nerd Font", { weight = "Regular", italic = false }),
	font_size = 30.0,
	enable_tab_bar = false,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	color_scheme = "tokyonight_night",
	color_schemes = {
		tokyonight_storm = {
			foreground = "#c0caf5",
			background = "#24283b",
			cursor_bg = "#c0caf5",
			cursor_border = "#c0caf5",
			cursor_fg = "#24283b",
			selection_bg = "#364A82",
			selection_fg = "#c0caf5",
			ansi = { "#1D202F", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
			brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
		},
		tokyonight_night = {
			foreground = "#c0caf5",
			background = "#1a1b26",
			cursor_bg = "#c0caf5",
			cursor_border = "#c0caf5",
			cursor_fg = "#1a1b26",
			selection_bg = "#33467C",
			selection_fg = "#c0caf5",
			ansi = { "#15161E", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
			brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
		},
	},
	disable_default_key_bindings = true,
	adjust_window_size_when_changing_font_size = true,
	keys = {
		{ key = "c", mods = "ALT", action = wezterm.action({ SendString = "\x03" }) },
		{ key = "c", mods = "CTRL", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
		{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
	},
}
