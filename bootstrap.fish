#!/usr/bin/env fish

function ask_yes_or_no
    set -l result ( read -P "$argv ([y]es or [N]o): " | tr '[A-Z]' '[a-z]' )

    switch $result
        case y yes
            true
        case '*'
            false
    end
end

if ask_yes_or_no "Symlink '~/.config/fish' to dotfiles?"
    ln -sf ~/dotfiles/fish ~/.config/fish
end

if ask_yes_or_no "Symlink '~/.gitconfig' to dotfiles?"
    if ask_yes_or_no "Regarding '~/.gitconfig', are you at work?"
        ln -sf ~/dotfiles/git/gitconfig-work ~/.gitconfig
    else
        ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
    end
end

if ask_yes_or_no "Symlink '~/.config/helix/' to dotfiles?"
    ln -sf ~/dotfiles/helix/ ~/.config/helix
end

if ask_yes_or_no "Symlink '~/.config/nvim/init.vim' to dotfiles?"
    ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
end

if ask_yes_or_no "Symlink '~/.config/kitty' to dotfiles?"
    ln -sfn ~/dotfiles/kitty ~/.config/kitty
end

# Linux

if _is_linux
    if type dconf &>/dev/null && ask_yes_or_no "Restore Gnome settings"
        ./gnome/restore-settings.fish
    end
end

# Mac

if _is_mac
    if ask_yes_or_no "Symlink '~/.hammerspoon' to dotfiles"
        ln -sfn ~/dotfiles/hammerspoon ~/.hammerspoon
    end

    if ask_yes_or_no "Symlink '~/.amethyst' to dotfiles"
        ln -sfn ~/dotfiles/amethyst/amethyst.yml ~/.amethyst.yml
    end
end

# VSCode/VSCodium

if ask_yes_or_no "Symlink VSCodium to dotfiles?"
    if _is_linux
        ln -sfn ~/dotfiles/vscodium/keybindings.json ~/.config/VSCodium/User/keybindings.json
        ln -sfn ~/dotfiles/vscodium/settings.json ~/.config/VSCodium/User/settings.json
        ln -sfn ~/dotfiles/vscodium/snippets ~/.config/VSCodium/User/snippets
    else if _is_mac
        ln -sfn ~/dotfiles/vscodium/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
        ln -sfn ~/dotfiles/vscodium/settings.json ~/Library/Application\ Support/Code/User/settings.json
        ln -sfn ~/dotfiles/vscodium/snippets ~/Library/Application\ Support/Code/User/snippets
    end
end
if ask_yes_or_no "Install VSCodium extensions?"
    cat ~/dotfiles/vscodium/extensions.txt | xargs -L 1 codium --install-extension &>/dev/null
end
