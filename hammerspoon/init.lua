hyper_chord = { "cmd", "alt", "ctrl", "shift" }
shortcuts = {
  { chord = hyper_chord, key = "q", app = "Finder" },
  { chord = hyper_chord, key = "a", app = "Firefox" },
  { chord = hyper_chord, key = "s", app = "kitty" },
  { chord = hyper_chord, key = "d", app = "Visual Studio Code" },
  { chord = hyper_chord, key = "f", app = "Chromium" },
  { chord = hyper_chord, key = "r", app = "Obsidian" },
  { chord = hyper_chord, key = "e", app = "Slack" },
}

-- Application shortcuts

for i,shortcut in ipairs(shortcuts) do
    hs.hotkey.bind(shortcut["chord"], shortcut["key"], function()
        hs.application.launchOrFocus(shortcut["app"])
    end)
end
