#!/usr/bin/env fish

set -l gnome_backup_dir ( dirname ( status --current-filename ) )
set -l dconf_dump "$gnome_backup_dir/dconf-dump"
mkdir -p $dconf_dump

set -l restore_script "./$gnome_backup_dir/restore-settings.fish"
echo "#!/usr/bin/env fish
# Auto-generated script to restore settings like keybindings, do not edit directly!

set -l gnome_backup_dir \"$dconf_dump\"
" >$restore_script
chmod +x $restore_script

set -l namespaces
# Keybinding namespaces
set -a namespaces desktop/wm/keybindings
set -a namespaces mutter/keybindings
set -a namespaces mutter/wayland/keybindings
set -a namespaces settings-daemon/plugins/media-keys
set -a namespaces shell/keybindings
# Other more or less important settings
set -a namespaces desktop/interface

for namespace in $namespaces
    set -l origin "/org/gnome/$namespace/"
    set -l namespace_filepath "$dconf_dump/$namespace.conf"
    set -l namespace_directory $(dirname $namespace_filepath)
    set -l filename "$namespace.conf"

    mkdir -p $namespace_directory
    dconf dump $origin >"$namespace_filepath"

    # Add this namespace to the restoration script
    echo "dconf load $origin <\"\$gnome_backup_dir/$filename"\" >>$restore_script
end
