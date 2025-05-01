-- Pull in the wezterm API
local wezterm = require("wezterm")

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local ignored_processes = {
	"/usr/bin/bash",
	"/usr/bin/nvim",
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local fg_process_name = pane.foreground_process_name
	local title

	-- Check if foreground process is in ignored list
	local is_ignored = false
	for _, process in ipairs(ignored_processes) do
		if fg_process_name == process then
			is_ignored = true
			break
		end
	end

	if not is_ignored and fg_process_name ~= "" then
		title = (tab.tab_index + 1) .. ": " .. basename(fg_process_name)
	else
		title = basename(pane.current_working_dir)
	end

	return {
		{ Text = " " .. title .. " " },
	}
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Tokyo Night (Gogh)"

-- Fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16.0

config.window_padding = {
	-- 	left = 2,
	-- 	right = 2,
	-- 	top = 2,
	bottom = 0,
}

config.window_background_opacity = 0.9

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 24

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "rgba(11, 0, 34, 0.2)",

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "rgba(43, 32, 66, 0.2)",
			-- The color of the text for the tab
			fg_color = "#c0c0c0",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Bold",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = true,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "rgba(27, 16, 50, 0.2)",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
			intensity = "Bold",
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

-- and finally, return the configuration to wezterm
return config
