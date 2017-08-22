#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew manegement
brew update
brew upgrade

# Install homebrew-cask
#brew tap caskroom/cask # Latest versions of homebrew comes with cask

# Install all the brew packages

brew cask install java # Some formulae have java as a dip

brew install lua scala leiningen testdisk boot-clj git-flow wget dnscrypt-proxy hugo fish rsync coreutils findutils ffmpeg

brew cask install 1password hammerspoon monolingual tunnelblick android-platform-tools musescore vlc caffeine launchbar transmission the-unarchiver suspicious-package app-cleaner firefox karabiner-elements macdown veracrypt google-chrome iterm2

brew cleanup
brew cask cleanup