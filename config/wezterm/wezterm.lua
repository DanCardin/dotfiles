local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	local cwd = " " .. pane:get_current_working_dir():sub(8) .. " " -- remove file:// uri prefix
	local date = wezterm.strftime(" %I:%M %p  %A  %B %-d ")
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#ffffff" } },
		{ Background = { Color = "#005f5f" } },
		{ Text = cwd },
	}) .. wezterm.format({
		{ Foreground = { Color = "#00875f" } },
		{ Background = { Color = "#005f5f" } },
		{ Text = "" },
	}) .. wezterm.format({
		{ Foreground = { Color = "#ffffff" } },
		{ Background = { Color = "#00875f" } },
		{ Text = date },
	}) .. wezterm.format({
		{ Foreground = { Color = "#00af87" } },
		{ Background = { Color = "#00875f" } },
		{ Text = "" },
	}))
end)

return {
	show_update_window = false,
	enable_scroll_bar = true,
	check_for_updates = false,
	initial_rows = 51,
	initial_cols = 186,
	color_scheme = "kanagawabones",
	font = wezterm.font_with_fallback({ "SauceCodePro Nerd Font", "Apple Symbols", "Arial Unicode MS" }),
	font_size = 16,
	exit_behavior = "Close",
	leader = { key = "a", mods = "CTRL" },
	set_environment_variables = {
		TERM = "wezterm",
	},
	keys = {
		{ key = "r", mods = "SUPER", action = "ReloadConfiguration" },
		-- Pane Creation
		{
			key = "\\",
			mods = "SUPER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "'", mods = "SUPER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = '"',
			mods = "LEADER|SHIFT",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "x", mods = "SUPER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		-- Pane Navigation
		{ key = "z", mods = "SUPER", action = "TogglePaneZoomState" },
		{ key = "h", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "h", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		-- Pane Sizing
		{ key = "h", mods = "META", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "j", mods = "META", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },
		{ key = "k", mods = "META", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "l", mods = "META", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
		-- Tab Navigation
		{ key = "1", mods = "SUPER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "SUPER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "SUPER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "SUPER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "SUPER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "SUPER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "SUPER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "SUPER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "SUPER", action = wezterm.action({ ActivateTab = 8 }) },
		{
			key = "P",
			mods = "SUPER",
			action = wezterm.action.PaneSelect({
				mode = "SwapWithActive",
			}),
		},
	},
	unix_domains = {
		{
			name = "unix",
			connect_automatically = false,
		},
	},
	-- default_gui_startup_args = { "connect", "unix" },
	window_decorations = "RESIZE",
	window_background_opacity = 0.7,
	text_background_opacity = 0.7,
	hyperlink_rules = {
		{
			regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\bMA-(\\d+)\\b",
			format = "https://known.atlassian.net/browse/MA-$1",
		},
	},
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.3,
	},
}
