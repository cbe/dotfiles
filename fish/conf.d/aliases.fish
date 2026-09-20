# helix editor
if command -q helix
    abbr hx helix
end

# eza as `ls` replacement
if command -q eza
    abbr l 'eza -l'
    abbr t 'eza --tree --all --long --ignore-glob .git'
end

# bat as `cat` replacement
if command -q bat
    function cat
        bat $argv
    end
end

# Alias `codium` to `code`
if command -q codium
    function code
        codium $argv
    end
end

# Timetracking
if command -q timew
    abbr tt timew
    abbr tts 'timew summary :id :week'
    abbr ttg 'timew summary :id :yesterday'

    function timew-story
        timew | grep --extended-regexp --only-matching "T-[0-9]+"
    end
end
