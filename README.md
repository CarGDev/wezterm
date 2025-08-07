# WezTerm Configuration

This WezTerm configuration is designed to match your tmux styling while providing excellent Nerd Font support for development workflows.

## Features

- **Nerd Font Support**: Includes multiple Nerd Font fallbacks for optimal icon rendering
- **tmux-inspired Styling**: Color scheme and key bindings that match your tmux configuration
- **Enhanced Productivity**: Mouse support, pane splitting, and navigation shortcuts
- **Modern Terminal Experience**: GPU acceleration, ligatures, and smooth animations
- **tmux-like Leader Key System**: Uses `Ctrl+B` as prefix for pane and tab operations

## Installation

### 1. Install WezTerm

```bash
# macOS (using Homebrew)
brew install --cask wezterm

# Or download from: https://wezfurlong.org/wezterm/install/
```

### 2. Install Nerd Fonts

The configuration uses MesloLGS Nerd Font Mono. Install it:

```bash
# Using Homebrew (macOS)
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Or download manually from: https://www.nerdfonts.com/font-downloads
```

### 3. Install Configuration

```bash
# Copy the configuration to WezTerm's config directory
cp wezterm.lua ~/.config/wezterm/wezterm.lua

# Or if the directory doesn't exist:
mkdir -p ~/.config/wezterm
cp wezterm.lua ~/.config/wezterm/wezterm.lua
```

### 4. Restart WezTerm

Restart WezTerm to apply the new configuration.

## Key Bindings

The configuration uses a tmux-like leader key system with `Ctrl+B` as the prefix.

### Pane Operations (Leader Key: `Ctrl+B`)

#### Pane Splitting
- **`Ctrl+B, |`**: Split pane horizontally (left/right)
- **`Ctrl+B, -`**: Split pane vertically (top/bottom)

#### Pane Navigation
- **`Ctrl+B, Left Arrow`**: Move to left pane
- **`Ctrl+B, Right Arrow`**: Move to right pane
- **`Ctrl+B, Up Arrow`**: Move to upper pane
- **`Ctrl+B, Down Arrow`**: Move to lower pane

#### Pane Resizing
- **`Opt+Ctrl+Left Arrow`**: Resize pane left
- **`Opt+Ctrl+Right Arrow`**: Resize pane right
- **`Opt+Ctrl+Up Arrow`**: Resize pane up
- **`Opt+Ctrl+Down Arrow`**: Resize pane down

### Tab Operations

#### Leader Key Bindings (`Ctrl+B`)
- **`Ctrl+B, n`**: Next tab
- **`Ctrl+B, p`**: Previous tab
- **`Ctrl+B, c`**: Create new tab
- **`Ctrl+B, w`**: Close current tab
- **`Ctrl+B, t`**: Create new tab
- **`Ctrl+B, 1-9,0`**: Jump to specific tab (1-10)

#### Alternative Tab Navigation
- **`Ctrl+Shift+N`**: Next tab
- **`Ctrl+Shift+P`**: Previous tab
- **`Ctrl+Shift+C`**: Create new tab
- **`Ctrl+Shift+W`**: Close current tab
- **`Ctrl+Shift+T`**: Create new tab
- **`Ctrl+Shift+1-9,0`**: Jump to specific tab (1-10)

### General Operations
- **`Ctrl+R`**: Reload configuration
- **`Ctrl+Y`**: Copy to clipboard
- **`Ctrl+Shift+Enter`**: Toggle fullscreen
- **`Ctrl+Shift+L`**: Show launcher

## Color Scheme

The configuration uses the Tokyo Night color scheme:

- **Theme**: Tokyo Night (dark variant)
- **Font**: MesloLGS Nerd Font Mono (22pt)
- **Window**: 98% opacity with 60px blur on macOS
- **Selection**: Custom tmux-style highlight colors

## Font Features

The configuration supports:
- **Programming Ligatures**: Enhanced readability for code (`calt=1`, `clig=1`, `liga=1`)
- **Icon Support**: Git status, file types, and development icons via Nerd Fonts
- **Font Size**: 22.0pt for optimal readability
- **Harfbuzz Features**: Advanced text shaping and ligatures

## Performance Settings

- **GPU Acceleration**: OpenGL frontend with Wayland support
- **Kitty Graphics**: Enhanced graphics protocol support
- **Scrollback**: 20,000 lines for extensive history
- **Terminal**: xterm-256color for maximum compatibility

## Mouse Support

tmux-like mouse interactions:
- **Left Click + Drag**: Select text (auto-copy on release)
- **Right Click**: Paste from clipboard
- **Drag Selection**: Extend selection to mouse cursor

## Customization

### Font Size
Adjust the font size by modifying:
```lua
config.font_size = 22.0
```

### Color Scheme
Change the color scheme by modifying:
```lua
config.color_scheme = "tokyonight"
```

### Key Bindings
Add or modify key bindings in the `config.keys` section.

### Leader Key
Change the leader key by modifying:
```lua
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
```

## Troubleshooting

### Font Not Loading
If MesloLGS Nerd Font isn't displaying correctly:
1. Ensure the font is properly installed: `brew install --cask font-meslo-lg-nerd-font`
2. Check font names in the configuration
3. Restart WezTerm after font installation

### Key Bindings Not Working
If key bindings conflict with your system:
1. Check for conflicts with macOS shortcuts
2. Modify the `mods` values in the configuration
3. Use `config.disable_default_key_bindings = false` if needed

### Performance Issues
For better performance:
1. Ensure GPU acceleration is enabled (`config.front_end = "OpenGL"`)
2. Reduce `scrollback_lines` if memory usage is high
3. Disable `window_background_opacity` if needed

## tmux Compatibility

This configuration is designed to work seamlessly with tmux:
- **Leader Key**: Uses same `Ctrl+B` prefix as tmux
- **Pane Operations**: Identical keybindings to tmux when using leader key
- **Key Conflict Resolution**: Alt+Arrow keys are intentionally not bound in WezTerm to avoid conflicts with tmux's pane navigation
- **Colors**: Tokyo Night theme preserved in tmux
- **Mouse Support**: Works seamlessly with tmux mouse mode
- **Font Ligatures**: Maintained across tmux sessions
- **Terminal Type**: Configured as `xterm-256color` for maximum compatibility

### Using tmux inside WezTerm

When running tmux inside WezTerm:
1. **Pane Navigation**: Use `Alt+Arrow` keys (handled by tmux)
2. **Pane Splitting**: Use `Ctrl+B, |` for horizontal, `Ctrl+B, -` for vertical (handled by tmux)
3. **Pane Resizing**: Use `Ctrl+Alt+Arrow` keys (handled by tmux)
4. **Tab Management**: Use `Ctrl+B` followed by tab commands (handled by tmux)

The WezTerm configuration intentionally avoids binding `Alt+Arrow` keys to prevent conflicts with tmux's pane navigation system.

## Usage Examples

### Development Workflow
1. **`Ctrl+B, |`** - Split horizontally for code and terminal
2. **`Ctrl+B, -`** - Split vertically for multiple terminals
3. **`Ctrl+B, Arrow Keys`** - Navigate between panes
4. **`Opt+Ctrl+Arrow Keys`** - Resize panes as needed

### Tab Management
1. **`Ctrl+B, c`** - Create new tab for different project
2. **`Ctrl+B, 1-9`** - Quick jump to specific tabs
3. **`Ctrl+B, n/p`** - Navigate between tabs

### tmux Workflow
1. **`Alt+Arrow`** - Navigate between tmux panes
2. **`Ctrl+B, |`** - Split tmux pane horizontally
3. **`Ctrl+B, -`** - Split tmux pane vertically
4. **`Ctrl+Alt+Arrow`** - Resize tmux panes

## Additional Resources

- [WezTerm Documentation](https://wezfurlong.org/wezterm/)
- [Tokyo Night Theme](https://github.com/folke/tokyonight.nvim)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [tmux Documentation](https://github.com/tmux/tmux/wiki)