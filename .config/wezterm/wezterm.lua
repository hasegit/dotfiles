local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'cyberpunk'

config.automatically_reload_config = true
config.default_workspace = "operation"
config.font_size = 15.0
config.font = wezterm.font_with_fallback({
	"Hasevka",
	"PlemolJP",
  {family = "Symbols Nerd Font", scale = 0.88},
	"FiraCode Nerd Font",
})

config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.2,
}

config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

config.window_background_opacity = 0.88
config.macos_window_background_blur = 5
config.window_background_gradient = {
	orientation = { Linear = { angle = -55.0 } },
	colors = {
		"#000000",
		"#000000",
		"#31145a",
	},
	interpolation = "CatmullRom",
}
config.window_decorations = "RESIZE"
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
	font_size = 15.0,
	font = wezterm.font_with_fallback({
		"Hasevka",
		{ family = "Symbols Nerd Font", scale = 1 },
		"PlemolJP",
	}),
}

-- Tab
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " "
	local background = tab.is_active and "#6a35b8" or "#31145a"
	local foreground = tab.is_active and "#ffaaff" or "#9a35b8"

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = wezterm.nerdfonts.pom_away },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		--{ Text = wezterm.nerdfonts.ple_pixelated_squares_small },
	}
end)

-- Left Status
wezterm.on("update-status", function(window, pane)
	local stat = window:active_workspace()

	window:set_left_status(wezterm.format({
		{ Foreground = { Color = "#aa66aa" } },
		{ Background = { Color = "none" } },
		{ Text = " 󰯉 " .. stat .. "" },
	}))
end)

-- Right Status
wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%a %b %-d")
	local time = wezterm.strftime("%H:%M:%S")
	local bat = ""
	local batIcon = wezterm.nerdfonts.md_battery_unknown
	local batIconTable = {
		["Full"] = wezterm.nerdfonts.md_battery,
		["Charging"] = wezterm.nerdfonts.md_battery_charging,
		["Discharging"] = wezterm.nerdfonts.md_battery_arrow_down,
		["Empty"] = wezterm.nerdfonts.md_battery_outline,
	}
	for _, b in ipairs(wezterm.battery_info()) do
		bat = string.format("%.0f%%", b.state_of_charge * 100)
		batIcon = batIconTable[b.state]
	end

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#888888" } },
		{ Background = { Color = "none" } },
		{
			Text = ""
				.. wezterm.nerdfonts.oct_triangle_left
				.. " "
				.. wezterm.nerdfonts.cod_calendar
				.. " "
				.. date
				.. " "
				.. wezterm.nerdfonts.oct_triangle_left
				.. " "
				.. wezterm.nerdfonts.md_clock_outline
				.. " "
				.. time
				.. " "
				.. wezterm.nerdfonts.oct_triangle_left
				.. " "
				.. batIcon
				.. " "
				.. bat
				.. " ",
		},
	}))
end)

-- Key Binding
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
