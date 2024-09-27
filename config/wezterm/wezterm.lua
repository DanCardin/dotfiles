local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#3c1361",
		"#52307c",
		"#663a82",
		"#7c5295",
		"#b491c8",
	}

	-- Foreground color for the text across the fade
	local text_fg = "#c0c0c0"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

local function isViProcess(pane)
	local proc = pane:get_foreground_process_name()
	if proc then
		return proc:find("n?vim") ~= nil
	end
	return false
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "CTRL" }), pane)
	else
		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

local function docker_list()
	local docker_list = {}
	local success, stdout, stderr = wezterm.run_child_process({
		os.getenv("SHELL"),
		"-c",
		"'docker container ls --format ''{{.ID}}:{{.Names}}'''",
	})
	for _, line in ipairs(wezterm.split_by_newlines(stdout)) do
		local id, name = line:match("(.-):(.+)")
		if id and name then
			docker_list[id] = name
		end
	end
	return docker_list
end

local function make_docker_label_func(id)
	return function(name)
		local success, stdout, stderr = wezterm.run_child_process({
			"docker",
			"inspect",
			"--format",
			"{{.State.Running}}",
			id,
		})
		local running = stdout == "true\n"
		local color = running and "Green" or "Red"
		return wezterm.format({
			{ Foreground = { AnsiColor = color } },
			{ Text = "docker container named " .. name },
		})
	end
end

local function make_docker_fixup_func(id)
	return function(cmd)
		cmd.args = cmd.args or { "/bin/sh" }
		local wrapped = {
			"docker",
			"exec",
			"-it",
			id,
		}
		for _, arg in ipairs(cmd.args) do
			table.insert(wrapped, arg)
		end

		cmd.args = wrapped
		return cmd
	end
end

local function compute_exec_domains()
	local exec_domains = {}
	for id, name in pairs(docker_list()) do
		table.insert(
			exec_domains,
			wezterm.exec_domain("docker:" .. name, make_docker_fixup_func(id), make_docker_label_func(id))
		)
	end
	return exec_domains
end

local exec_domains = compute_exec_domains()
for k, v in pairs(exec_domains) do
	wezterm.log_info(k .. ": " .. tostring(v))
end

return {
	exec_domains = exec_domains,
	enable_scroll_bar = true,
	check_for_updates = false,
	initial_rows = 51,
	initial_cols = 186,
	color_scheme = "kanagawabones",
	font = wezterm.font({
		family = "SauceCodePro Nerd Font",
		weight = "Regular",
		harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" },
	}),
	font_size = 17,
	font_rules = {
		--
		-- Italic (comments)
		--
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = "Monaspace Radon",
				weight = "ExtraLight",
				stretch = "Normal",
				style = "Normal",
				harfbuzz_features = {
					"calt",
					"liga",
					"dlig",
					"ss01",
					"ss02",
					"ss03",
					"ss04",
					"ss05",
					"ss06",
					"ss07",
					"ss08",
				},
			}),
		},
	},
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
		-- { key = "h", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		-- { key = "j", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		-- { key = "k", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		-- { key = "l", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		-- { key = "h", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		-- { key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		-- { key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		-- { key = "l", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "h", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
		{ key = "j", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
		{ key = "k", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
		{ key = "l", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },
		{ key = "h", mods = "SUPER", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
		{ key = "j", mods = "SUPER", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
		{ key = "k", mods = "SUPER", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
		{ key = "l", mods = "SUPER", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },
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
		{ key = "F11", action = wezterm.action.ToggleFullScreen },
		{ key = "e", mods = "SUPER", action = wezterm.action.SendKey({ key = "e", mods = "CTRL" }) },

		{ key = "o", mods = "SUPER", action = wezterm.action.ShowLauncher },
	},
	unix_domains = {
		{
			name = "unix",
			connect_automatically = true,
		},
	},
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
	-- default_gui_startup_args = { 'connect', 'unix' },
	macos_window_background_blur = 10,

	ssh_domains = {
		{
			name = "docker",
			remote_address = "192.168.86.8",
			username = "dan",
		},
		{
			name = "dev",
			remote_address = "192.168.86.9",
			username = "dan",
		},
	},
}
