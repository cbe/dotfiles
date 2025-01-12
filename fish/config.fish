# Configure language
set -gx LANGUAGE $(env | grep LANG | head -n 1 | cut -d '=' -f2)
set -gx LC_ALL $(env | grep LANG | head -n 1 | cut -d '=' -f2)

# Configure environment
fish_add_path "$HOME/dotfiles/additional-binaries"

# Disable fishs default greeting message by emptying it
set -g fish_greeting

## Key bindings
bind \e\[3\;5~ kill-word # Ctrl + Delete
bind \e\[3\;3~ kill-word # Alt + Delete
bind \cQ suppress-autosuggestion # Ctrl + Q

## Aliases

# Neovim
if _has_program nvim
    set -gx EDITOR nvim
    alias vi='nvim'
    alias vim='nvim'
end

# eza as `ls` replacement
if _has_program eza
    alias l='eza -l'
    alias t='eza --tree --all --long --ignore-glob .git'
end

# bat as `cat` replacement
if _has_program bat
    set -gx BAT_THEME base16
    alias cat='bat'
end

# Alias `codium` to `code`
if _has_program codium
    alias code='codium'
end

# Timetracking
if _has_program timew
    alias tt='timew'
    alias tts='timew summary :id :week'
    alias ttg='timew summary :id :yesterday'
end

if status is-interactive
    # Enable colors when using SSH with kitty
    if _has_program kitty
        set -gx TERM xterm-256color
    end

    ## Initializations
    # Untracked functions
    set -a fish_function_path $HOME/dotfiles/fish/additional

    # starship prompt
    if _has_program starship
        set -gx STARSHIP_CONFIG "$HOME/dotfiles/starship/starship.toml"
        starship init fish | source
    end

    # zoxide, smart `cd`
    if _has_program zoxide
        zoxide init fish | source
    end

    # fnm, node manager
    if _has_program fnm
        fnm env --use-on-cd | source
    end

    if _is_linux
        if _has_program xsel
            # Replicates useful pastebin helper from macOS
            alias pbcopy='xsel --clipboard --input'
            alias pbpaste='xsel --clipboard --output'
        end

        if _has_program xdg-open
            # Replicates 'open' helper from macOS
            alias open='xdg-open'
        end
    end

    if _is_mac
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin

        if test ! -f "$HOME/dotfiles/.github-api-token"
            echo ⚠️ Warning: no API token for GitHub found, which is required for smooth brew operations
        else
            set -gx HOMEBREW_GITHUB_API_TOKEN $(cat "$HOME/dotfiles/.github-api-token")
        end
    end
end
