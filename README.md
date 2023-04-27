# dotfiles 📜

| ℹ️ | This repository is expected to be cloned to $HOME/dotfiles |
| - | :--------------------------------------------------------- |

## Required packages

- [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh#unattended-install)

### Linux

```sh
sudo pacman -S \
  kitty \            # Terminal
  neovim \
  starship \         # Command line prompt
  ttf-iosevka-nerd \ # Nerd font is recommended for `starship` prompt
  # ttc-iosevka \    # Optional, see line above
  xsel \             # For copy/pasta 🍝 convenience, see `zsh/aliases`
  yay
sudo yay -S \
  vscodium-bin
```

### MacOS

```sh
# Configure GitHub API token for brew to run smoothly
cp .github-api-token.example .github.api-token
# Insert API token in this file

# Install brew: https://brew.sh/#install

# Install dependencies
brew bundle
```

## Bootstrap script

This will help preparing symlinks for various tools as well as some basic configurations, nothing too fancy here.

```sh
./bootstrap.sh
```

## Other configurations

### Visual Studio Code

These 2 lines help managing installed extensions

```sh
# Install extensions from a simple text file
cat ~/dotfiles/vscodium/extensions.txt | xargs -L 1 code --install-extension

# This previous list can be generated and kept up to date by running
code --list-extensions > ~/dotfiles/vscodium/extensions.txt
```
See also: https://www.elliotdenolf.com/posts/backup-restore-vs-code-extensions

### [yarn](https://yarnpkg.com/getting-started/install)

```
corepack enable
```

## Optional/deprecated symlinks

### Sublime Text 3

Since I no longer use it I don't need it in the [Bootstrap Script](#Bootstrap-script)

#### Linux

```
ln -s ~/dotfiles/sublime/packages/user/ ~/.config/sublime-text-3/Packages/User
```

#### MacOS

```
ln -s ~/dotfiles/sublime/packages/user/ ~/Library/Application Support/Sublime Text 3/Packages/User/
```

### MacOS

#### Command Line Tools

```
sudo xcode-select --install
sudo xcodebuild -license accept
```

#### Adjust `~/.ssh/config`

```
ServerAliveInterval 240
IdentitiesOnly yes
UseKeychain yes
```
