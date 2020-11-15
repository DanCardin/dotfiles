local wezterm = require 'wezterm';

return {
  color_scheme = "Gruvbox Dark",
  font = wezterm.font("SauceCodePro Nerd Font"),
  leader = { key="a", mods="CTRL" },
  keys = {
    { key = "|", mods = "SUPER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}} },
    { key = "\"", mods = "SUPER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },
    { key = "z", mods = "SUPER", action="TogglePaneZoomState" },
    { key = "h", mods = "SUPER", action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j", mods = "SUPER", action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k", mods = "SUPER", action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l", mods = "SUPER", action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "h", mods = "META", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "j", mods = "META", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "k", mods = "META", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "l", mods = "META", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
    { key = "1", mods = "SUPER", action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "SUPER", action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "SUPER", action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "SUPER", action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "SUPER", action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "SUPER", action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "SUPER", action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "SUPER", action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "SUPER", action=wezterm.action{ActivateTab=8}},
    { key = "&", mods = "SUPER|SHIFT", action="CloseCurrentTab"},
  },
  hyperlink_rules = {
    {
      regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },
    {
      regex = "\\bMA-(\\d+)\\b",
      format = "https://known.atlassian.net/browse/MA-$1",
    }
  },
  unix_domains = {
    {
      name = "unix",
      connect_automatically = true,
    }
  }
}
