# Linux specific configuration
if status is-interactive
    if is_linux
        if command -q xsel
            # Replicates useful pastebin helper from macOS
            function pbcopy
                xsel --clipboard --input $argv
            end
            function pbpaste
                xsel --clipboard --output $argv
            end
        end

        if command -q xdg-open
            # Replicates 'open' helper from macOS
            function open
                xdg-open $argv
            end
        end
    end
end
