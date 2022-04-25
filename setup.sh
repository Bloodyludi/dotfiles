#! /usr/bin/env bash

# Will need superuser privileges sooner or later
echo "Need superuser privileges..."
sudo -v

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
fi

if ! command -v stow >/dev/null 2>&1; then
  echo "Installing stow..."
  brew install stow
fi

for folder in {zsh,brew,lvim,asdf}; do
  echo "Symlinking $folder..."
  stow --verbose --ignore=\.DS_Store --target ~ "$folder"
done

echo "Installing applications via homebrew..."
brew bundle --global

echo "Updating applications from app store..."
mas upgrade

echo "Adding asdf plugins..."
cut -d ' ' -f1 ~/.tool-versions | xargs -I % asdf plugin add %

echo "Installing asdf runtimes..."
asdf install

if ! command -v stow >/dev/null 2>&1; then
  echo "Installing lunarVim..."
  yarn_dir="$(yarn global bin 2>/dev/null)"
  [[ -d $yarn_dir ]] || mkdir -p "$yarn_dir"
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
fi

echo "Running fzf install script"
$(brew --prefix)/opt/fzf/install

if ! test -e "${HOME}/.iterm2_shell_integration.zsh"; then
  echo "Installing iTerm2 shell integration..."
  curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | /bin/bash
fi

./macos-defaults.sh
