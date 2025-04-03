# dotfiles 📜

| ℹ️   | This repository is expected to be cloned to $HOME/dotfiles |
| --- | :--------------------------------------------------------- |

## Required packages

### Linux

```sh
pacman -S \
  eza \              # eza is an ls replacement
  fish \             # fish-shell
  kitty \            # Terminal
  neovim \
  helix \
  skim \             # Fuzzy finder
  starship \         # Command line prompt
  ttc-iosevka \      # Main monospaced font
  xsel \             # For copy/pasta 🍝 convenience, see `fish/config.fish`
  yay \
  zoxide
yay -S \
  vscodium-bin
```

### MacOS

#### Brew setup

```sh
# Configure GitHub API token for brew to run smoothly
cp .github-api-token.example .github.api-token
# Insert API token in this file

# Install brew: https://brew.sh/#install

# Install dependencies
brew bundle
```

### Recommended packages

#### Linux

```sh
pacman -S \
  typescript-language-server \      # helix editor
  vscode-css-language-server        # helix editor

yay -S \
  superhtml                         # helix editor
```

## Bootstrap script

This will help preparing symlinks for various tools as well as some basic configurations, nothing too fancy here. Requires [`fish`](https://fishshell.com/) shell.

```sh
./bootstrap.fish
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

### macOS

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
