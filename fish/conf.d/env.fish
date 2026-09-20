set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME $HOME/.config

# Set language
set -gx LANGUAGE $(env | grep LANG | head -n 1 | cut -d '=' -f2)
set -gx LC_ALL $(env | grep LANG | head -n 1 | cut -d '=' -f2)

# Set path
fish_add_path "$HOME/dotfiles/additional-binaries"
# Untracked functions
set -a fish_function_path $HOME/dotfiles/fish/additional

# Disable fishs default greeting message by emptying it
set -g fish_greeting

if status is-interactive
    # starship prompt
    if command -q starship
        set -gx STARSHIP_CONFIG "$HOME/dotfiles/starship/starship.toml"
        starship init fish | source
    end
end
