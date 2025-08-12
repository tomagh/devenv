local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- Color schemes: https://wezterm.org/colorschemes/index.html
if wezterm.gui.get_appearance() == "Dark" then
--   config.color_scheme = "Google Dark (Gogh)"
  config.color_scheme = "GitHub Dark Dark (Gogh)"
else
  config.color_scheme = "Google Light (Gogh)"
end


config.leader = { key = 'q', mods = 'ALT', timeout_milliseconds = 2000 }
config.keys = {
    -- Splint panes
    {
        key = 'h',
        mods = 'ALT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'v',
        mods = 'ALT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'ALT',
        action = act.CloseCurrentPane { confirm = true },
    },
    -- Activate panes
    {
        key = 'LeftArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Down',
    },
    -- Resize panes
    {
        key = 'LeftArrow',
        mods = 'ALT|CMD',
        action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'RightArrow',
        mods = 'ALT|CMD',
        action = act.AdjustPaneSize { 'Right', 5 },
    },
    {
        key = 'UpArrow',
        mods = 'ALT|CMD',
        action = act.AdjustPaneSize { 'Up', 5 },
    },
    {
        key = 'DownArrow',
        mods = 'ALT|CMD',
        action = act.AdjustPaneSize { 'Down', 5 },
    },
}

-- Font from Brewfile
-- Nerd fonts: https://www.nerdfonts.com
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14.0

-- Window settings
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 10

-- Maximize window on startup
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- Tab bar settings
-- config.enable_tab_bar = true
-- config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
-- config.use_fancy_tab_bar = false

-- Cursor settings
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"


-- Status bar settings

-- wezterm.plugin
--   .require('https://github.com/yriveiro/wezterm-status')
--   .apply_to_config(config, {
--     cells = {
--       battery = { enabled = false },
--       date = { format = '%H:%M' }
--     }
--   })

return config