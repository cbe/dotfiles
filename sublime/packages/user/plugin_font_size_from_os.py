import sublime
import sublime_plugin

default_font_size = 13
osx_font_size = 18
windows_font_size = 12

def plugin_loaded():
  main_settings_file = "Preferences.sublime-settings"
  main_settings = sublime.load_settings(main_settings_file)

  plain_tasks_settings_file = "PlainTasks.sublime-settings"
  plain_tasks_settings = sublime.load_settings(plain_tasks_settings_file)

  if sublime.platform() == "osx":
    main_settings.set("font_size", osx_font_size)
    plain_tasks_settings.set("font_size", osx_font_size)

  elif sublime.platform() == "windows":
    main_settings.set("font_size", windows_font_size)
    plain_tasks_settings.set("font_size", windows_font_size)

  else:
    main_settings.set("font_size", default_font_size)
    plain_tasks_settings.set("font_size", default_font_size)
