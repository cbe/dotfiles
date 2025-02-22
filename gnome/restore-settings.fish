#!/usr/bin/env fish
# Auto-generated script to restore settings like keybindings, do not edit directly!

set -l gnome_backup_dir "./gnome/dconf-dump"

dconf load /org/gnome/desktop/wm/keybindings/ <"$gnome_backup_dir/desktop/wm/keybindings.conf"
dconf load /org/gnome/mutter/keybindings/ <"$gnome_backup_dir/mutter/keybindings.conf"
dconf load /org/gnome/mutter/wayland/keybindings/ <"$gnome_backup_dir/mutter/wayland/keybindings.conf"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ <"$gnome_backup_dir/settings-daemon/plugins/media-keys.conf"
dconf load /org/gnome/shell/keybindings/ <"$gnome_backup_dir/shell/keybindings.conf"
dconf load /org/gnome/desktop/interface/ <"$gnome_backup_dir/desktop/interface.conf"
