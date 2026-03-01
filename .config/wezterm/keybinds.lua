local wezterm = require("wezterm")
local act = wezterm.action

return {
	keys = {
		-- Select workspace
		{
			key = "w",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
		},
		-- Rename workspace
		{
			key = "r",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "(wezterm) Set workspace title:",
				action = wezterm.action_callback(function(win, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
		-- Split Horizontal
		{
			key = "\\",
			mods = "LEADER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		-- Split Vertical
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
    -- change pane
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    -- zoom pane
    { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
    -- close pane
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true} },
    -- Copy mode
    { key = 'c', mods = 'LEADER', action = act.ActivateCopyMode },
	},
}
