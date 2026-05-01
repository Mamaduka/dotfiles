#!/bin/sh

echo "Setting up your Mac..."

# Symlink .zshrc from dotfiles
if [ ! -L $HOME/.zshrc ]; then
  rm -f $HOME/.zshrc
  ln -s $DOTFILES/.zshrc $HOME/.zshrc
fi

# Copy gitconfig template (not symlinked — per-machine signing key gets added directly).
if [ ! -f $HOME/.gitconfig ]; then
  cp $DOTFILES/gitconfig $HOME/.gitconfig
fi

# Symlink starship config
mkdir -p $HOME/.config
if [ ! -L $HOME/.config/starship.toml ]; then
  rm -f $HOME/.config/starship.toml
  ln -s $DOTFILES/starship.toml $HOME/.config/starship.toml
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file $DOTFILES/Brewfile

# Install global Composer packages
composer global require laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create site directories
mkdir -p $HOME/Projects
mkdir -p $HOME/Sites

# Import iTerm2 color scheme (opens iTerm; manually select profile after).
open $DOTFILES/material-palette.itermcolors
