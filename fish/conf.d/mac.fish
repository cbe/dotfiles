# Mac OS specific configuration
if status is-interactive
    if is_mac
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin

        if test ! -f "$HOME/dotfiles/.github-api-token"
            echo ⚠️ Warning: no API token for GitHub found, which is required for smooth brew operations
        else
            set -gx HOMEBREW_GITHUB_API_TOKEN $(cat "$HOME/dotfiles/.github-api-token")
        end
    end
end
