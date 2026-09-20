set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME $HOME/.config

# Set language
set -gx LANGUAGE $(env | grep LANG | head -n 1 | cut -d '=' -f2)
set -gx LC_ALL $(env | grep LANG | head -n 1 | cut -d '=' -f2)

# Set path
fish_add_path "$HOME/dotfiles/additional-binaries"

# Disable fishs default greeting message by emptying it
set -g fish_greeting

# Set default editor
set -gx EDITOR vi
if command -q vim
    set -gx EDITOR vim
end
if command -q hx
    set -gx EDITOR hx
end
if command -q helix
    set -gx EDITOR helix
end

# bat is a `cat` replacement
if command -q bat
    set -gx BAT_THEME base16
end

if status is-interactive
    # Untracked functions
    set -a fish_function_path $HOME/dotfiles/fish/additional

    # starship prompt
    if command -q starship
        set -gx STARSHIP_CONFIG "$HOME/dotfiles/starship/starship.toml"
        starship init fish | source
    end

    # zoxide, smart `cd`
    if command -q zoxide
        zoxide init fish | source
    end

    # fnm, node manager
    if command -q fnm
        fnm env --use-on-cd | source
    end
end
