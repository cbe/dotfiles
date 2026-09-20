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
