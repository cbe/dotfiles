hyper_chord = { "cmd", "alt", "ctrl", "shift" }
shortcuts = {
  { chord = hyper_chord, key = "w", app = "Finder" },
  { chord = hyper_chord, key = "f", app = "bitwarden.app" },
  { chord = hyper_chord, key = "m", app = "Slack" },
  { chord = hyper_chord, key = "p", app = "Obsidian" },
  { chord = hyper_chord, key = "r", app = "Firefox" },
  { chord = hyper_chord, key = "s", app = "ghostty" },
  { chord = hyper_chord, key = "n", app = "Visual Studio Code" },
  { chord = hyper_chord, key = "t", app = "Chromium" },
  { chord = hyper_chord, key = "b", app = "Windows App" },
}

-- Application shortcuts

for i,shortcut in ipairs(shortcuts) do
    hs.hotkey.bind(shortcut["chord"], shortcut["key"], function()
        hs.application.launchOrFocus(shortcut["app"])
    end)
end
