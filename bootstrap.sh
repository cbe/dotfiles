#!/usr/bin/env bash
source ./zsh/functions

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.zshrc' to dotfiles?") ]]; then
  ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
fi

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

if [[ "yes" == $(ask_yes_or_no "Symlink '~/.emacs.d' to dotfiles?") ]]; then
  ln -sfn ~/dotfiles/emacs.d ~/.emacs.d
fi
