local wezterm = require("wezterm")

local function get_git_status(path)
  local success, stdout, stderr = wezterm.run_child_process({
    'git', '-C', path, 'status', '--porcelain=2', '-u', '-b'
  })
  local branch = ""
  local conflicted = 0
  local deleted = 0
  local renamed = 0
  local modified = 0
  local staged = 0
  local untracked = 0
  local ahead = 0
  local behind = 0

  for line in stdout:gmatch("[^\r\n]+") do
    local first = line:sub(1, 1)
    if first == '1' then
      local x = line:sub(3, 3)
      local y = line:sub(4, 4)
      if x ~= '.' then
        staged = staged + 1
      end
      if y == 'D' then
        deleted = deleted + 1
      elseif y == 'M' then
        modified = modified + 1
      end
    elseif first == '2' then
      renamed = renamed + 1
    elseif first == 'u' then
      conflicted = conflicted + 1
    elseif first == '?' then
      untracked = untracked + 1
    elseif first == '#' then
      branch = line:match("# branch.head%s+(%S+)")
      local a, b = line:match("branch%.ab %+(%d+) %-(%d+)")
      if a then
        ahead = a
        behind = b
      end
    end
  end

  -- format
  local result = {}
  if branch ~= "" then
    table.insert(result, wezterm.nerdfonts.pl_branch .. " " .. branch)
  end
  if ahead > 0 then
    table.insert(result, wezterm.nerdfonts.fa_circle_arrow_up .. " " .. ahead)
  end
  if behind > 0 then
    table.insert(result, wezterm.nerdfonts.fa_circle_arrow_down .. " " .. behind)
  end
  if conflicted > 0 then
    table.insert(result, wezterm.nerdfonts.md_meteor .. " " .. conflicted)
  end
  if deleted > 0 then
    table.insert(result, wezterm.nerdfonts.oct_diff_removed .. " " .. deleted)
  end
  if renamed > 0 then
    table.insert(result, wezterm.nerdfonts.oct_diff_renamed .. " " .. renamed)
  end
  if modified > 0 then
    table.insert(result, wezterm.nerdfonts.oct_diff_modified .. " " .. modified)
  end
  if staged > 0 then
    table.insert(result, wezterm.nerdfonts.oct_diff_added .. " " .. staged)
  end
  if untracked > 0 then
    table.insert(result, wezterm.nerdfonts.oct_diff_ignored .. " " .. untracked)
  end

  if #result > 0 then
    return table.concat(result, " ")
  end
  return ""
end

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.default_workspace = "operation"

-- appearance
config.color_scheme = 'Kasugano (terminal.sexy)'
config.font_size = 15.0
config.font = wezterm.font_with_fallback({
  "Hasevka",
  "PlemolJP",
  { family = "Symbols Nerd Font", scale = 0.99 },
  "FiraCode Nerd Font",
})
config.line_height = 1.2
config.macos_window_background_blur = 5
local background_dark = '#0e0022'
config.background = {
  {
    source = {
      Gradient = {
        colors = {
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          background_dark,
          "#8a44ff"
        },
        orientation = "Vertical",
      },
    },
    opacity = 0.88,
    width = "100%",
    height = "100%",
  },
}

-- cursor
config.default_cursor_style = "SteadyUnderline"
config.cursor_thickness = 2

-- frame
local frame_size = '8pt'
config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
  border_left_width = frame_size,
  border_left_color = '#8a44ff',
  border_right_width = frame_size,
  border_right_color = '#8a44ff',
  border_bottom_height = frame_size,
  border_bottom_color = '#8a44ff',
  border_top_height = frame_size,
  border_top_color = '#8a44ff',
  font_size = 15.0,
  font = wezterm.font_with_fallback({
    "Hasevka",
    { family = "Symbols Nerd Font", scale = 1 },
    "PlemolJP",
  }),
}

-- inactive pane
config.inactive_pane_hsb = {
  saturation = 0.3,
  brightness = 0.6,
}

-- Tab
config.use_fancy_tab_bar = false
config.tab_max_width = 40
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
  cursor_bg = "#8a44ff",
  cursor_fg = "#ffffff",
  tab_bar = {
    background = 'none',
  },
  split = "#8a44ff"
}
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)

  -- Nvimの時はアイコンを消す
  local pane = tab.active_pane
  local process_name = pane.foreground_process_name or ""
  local prefix = wezterm.nerdfonts.fa_waze .. "  "
  if process_name:match('nvim') then
    prefix = ""
  end

  local title = prefix .. wezterm.truncate_right(tab.active_pane.title, max_width - 2)
  local foreground = tab.is_active and "#ddccff" or "#ba99ff"
  local intensity = tab.is_active and "Bold" or "Normal"
  local underline = tab.is_active and "Double" or "None"

  local return_val = {
    { Foreground = { Color = "#ffffff" } },
    { Background = { Color = "#8a44ff" } },
    { Text = wezterm.nerdfonts.ple_right_half_circle_thin },
    { Attribute = { Underline = 'None' } },
    { Background = { Color = "#8a44ff" } },
    { Text = " " },

    { Attribute = { Underline = underline } },
    { Attribute = { Intensity = intensity } },
    { Foreground = { Color = foreground } },
    { Background = { Color = "#8a44ff" } },
    { Text = title .. " " },
  }

  if tab.tab_index == #tabs - 1 then
    wezterm.log_info("Current Tab Index: " .. tab.tab_index .. "tabs: " .. #tabs)
    table.insert(return_val, { Foreground = { Color = "#8a44ff" } })
    table.insert(return_val, { Background = { Color = "None" } })
    table.insert(return_val, { Text = wezterm.nerdfonts.ple_right_half_circle_thick })
  end

  return return_val
end)

-- Left Status
wezterm.on("update-status", function(window, pane)
  local stat = window:active_workspace()
  local mode = wezterm.nerdfonts.fa_frog
  local mode_fg = "#a1ff60"
  if window:leader_is_active() then
    mode = wezterm.nerdfonts.md_space_invaders
    mode_fg = "#ff89af"
  end

  window:set_left_status(wezterm.format({
    { Foreground = { Color = mode_fg } },
    { Background = { Color = "#8a44ff" } },
    { Text = "  " .. mode .. " " },
    { Foreground = { Color = "#ffffff" } },
    { Background = { Color = "#8a44ff" } },
    { Text = " " .. stat .. " " },
  }))
end)

-- Right Status
wezterm.on("update-right-status", function(window, pane)
  -- date & time
  local date = wezterm.strftime("%a %b %-d")
  local time = wezterm.strftime("%H:%M:%S")

  -- battery
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

  -- Git info
  local cwd = pane:get_current_working_dir()
  local path = cwd.file_path
  local git_status = get_git_status(path)

  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#8a44ff" } },
    { Background = { Color = "none" } },
    { Text = wezterm.nerdfonts.ple_left_half_circle_thick },
    { Foreground = { Color = "#ffffff" } },
    { Background = { Color = "#8a44ff" } },
    {
      Text = " "
          .. git_status
          .. " "
          .. wezterm.nerdfonts.ple_left_half_circle_thin
          .. " "
          .. wezterm.nerdfonts.cod_calendar
          .. "  "
          .. date
          .. " "
          .. wezterm.nerdfonts.ple_left_half_circle_thin
          .. " "
          .. wezterm.nerdfonts.md_clock_outline
          .. "  "
          .. time
          .. " "
          .. wezterm.nerdfonts.ple_left_half_circle_thin
          .. " "
          .. batIcon
          .. " "
          .. bat
          .. "  ",
    },
  }))
end)

-- Key Binding
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
