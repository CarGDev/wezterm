local wezterm = require 'wezterm'
local config = {}

-- Font Configuration
config.font = wezterm.font("MesloLGS Nerd Font Mono", { 
  weight = "Regular", 
  italic = false 
})
config.font_size = 22.0
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- Color scheme
config.color_scheme = "tokyonight"

-- Window settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.98
config.macos_window_background_blur = 60
config.automatically_reload_config = true
config.default_cwd = wezterm.home_dir
config.initial_rows = 30
config.initial_cols = 120
config.adjust_window_size_when_changing_font_size = false

-- Tab bar settings (matching tmux window-status-separator)
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.tab_max_width = 25



-- Window frame
config.window_frame = {
  active_titlebar_bg = "#3c3836",
  inactive_titlebar_bg = "#282828",
}

-- tmux-like leader key configuration
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

-- tmux-like key bindings
-- Note: Alt+Arrow keys are intentionally not bound here to avoid conflicts with tmux
-- tmux uses Alt+Arrow for pane navigation, so we let tmux handle those keys
config.keys = {
  -- Pane splitting with leader key (Ctrl+B)
  {
    key = '|',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Pane navigation with leader key (Ctrl+B) - only when not in tmux
  {
    key = 'LeftArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Pane resizing with Opt+Ctrl+Arrow keys (only when not in tmux)
  -- Note: These don't conflict with tmux as tmux uses Alt+Arrow for navigation
  {
    key = 'LeftArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  -- Tab navigation (tmux-like with Ctrl+B prefix)
  {
    key = 'p',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- Leader key bindings (Ctrl+B followed by key)
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  -- Number keys for quick tab access (Ctrl+B + number)
  {
    key = '1',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = '0',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(9),
  },
  -- Remove conflicting Ctrl+N and Ctrl+P bindings for Neovim compatibility
  -- {
  --   key = 'n',
  --   mods = 'CTRL',
  --   action = wezterm.action.ActivateTabRelative(1),
  -- },
  -- {
  --   key = 'p',
  --   mods = 'CTRL',
  --   action = wezterm.action.ActivateTabRelative(-1),
  -- },
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  -- Tab management (additional tmux-like features)
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = '1',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = '0',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTab(9),
  },
  {
    key = 'Y',
    mods = 'CTRL',
    action = wezterm.action.CopyTo("Clipboard"),
  },
  {
    key = 'r',
    mods = 'CTRL',
    action = wezterm.action.ReloadConfiguration,
  },
  -- Quality of life improvements
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncher,
  },
}

-- Mouse support (tmux-like copy on select)
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.SelectTextAtMouseCursor 'Cell',
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection', pane)
      window:perform_action(wezterm.action.ClearSelection, pane)
    end),
  },
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  -- Experimental: Copy while dragging (like tmux set-clipboard on)
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.ExtendSelectionToMouseCursor 'Cell',
  },
}

-- Performance settings
config.enable_wayland = true
config.enable_kitty_graphics = true
config.enable_csi_u_key_encoding = true
config.front_end = "OpenGL"
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

-- Enhanced settings
config.scrollback_lines = 20000
config.term = 'xterm-256color'

-- tmux compatibility settings
-- Ensure tmux can properly handle its own keybindings
config.enable_csi_u_key_encoding = true

-- tmux-style selection colors (crispy highlight)
config.colors = {
  selection_fg = "#282828",  -- foreground text when selected
  selection_bg = "#a89984",  -- background highlight color (tmux-ish)
}
return config
