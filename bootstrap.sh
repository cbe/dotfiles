#!/usr/bin/env bash

# https://stackoverflow.com/a/17695543
function ask_yes_or_no() {
  read -p "$1 ([y]es or [N]o): "
  case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
    y|yes) echo "yes" ;;
    *)     echo "no" ;;
  esac
}

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.config/fish' to dotfiles?") ]]; then
  ln -sf ~/dotfiles/fish ~/.config/fish
fi

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.gitconfig' to dotfiles?") ]]; then
  if [[ "yes" == $(ask_yes_or_no "Regarding '~/.gitconfig', are you at work?") ]]; then
    ln -sf ~/dotfiles/git/gitconfig-work ~/.gitconfig
  else
    ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
  fi
fi

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.config/helix/' to dotfiles?") ]]; then
  ln -sf ~/dotfiles/helix/ ~/.config/helix
fi

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.config/nvim/init.vim' to dotfiles?") ]]; then
  ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
fi

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.config/kitty' to dotfiles?") ]]; then
  ln -sfn ~/dotfiles/kitty ~/.config/kitty
fi

if [[ "yes" == $(ask_yes_or_no "Symlink VSCodium to dotfiles?") ]]; then
  if [[ _is_linux ]]; then
    ln -sfn ~/dotfiles/vscodium/keybindings.json ~/.config/VSCodium/User/keybindings.json
    ln -sfn ~/dotfiles/vscodium/settings.json ~/.config/VSCodium/User/settings.json
    ln -sfn ~/dotfiles/vscodium/snippets ~/.config/VSCodium/User/snippets
  elif [[ _is_mac ]]; then
    ln -sfn ~/dotfiles/vscodium/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    ln -sfn ~/dotfiles/vscodium/settings.json ~/Library/Application\ Support/Code/User/settings.json
    ln -sfn ~/dotfiles/vscodium/snippets ~/Library/Application\ Support/Code/User/snippets
  fi
fi
if [[ "yes" == $(ask_yes_or_no "Install VSCodium extensions?") ]]; then
  cat ~/dotfiles/vscodium/extensions.txt | xargs -L 1 codium --install-extension &> /dev/null
fi
