#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew manegement
brew update
brew upgrade

# Install homebrew-cask
#brew tap caskroom/cask # Latest versions of homebrew comes with cask

# Install all the brew packages

brew install lua scala leiningen testdisk boot-clj brew-graph git-flow wget dnscrypt-proxy hugo fish rsync coreutils findutils
brew cask install 1password hammerspoon monolingual tunnelblick android-platform-tools java musescore vlc caffeine launchbar transmission the-unarchiver suspicious-package app-cleaner firefox karabiner-elements macdown veracrypt google-chrome

brew cleanup
brew cask cleanup