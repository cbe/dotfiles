if status is-interactive
    # fnm, node manager
    if command -q fnm
        fnm env --use-on-cd | source
    end
end
