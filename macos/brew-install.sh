#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew manegement
brew update
brew upgrade

# Install homebrew-cask
brew tap caskroom/fonts

# Install all the brew packages

# Normal formulae
brew install lua scala leiningen testdisk boot-clj brew-graph git-flow wget
brew install dnscrypt-proxy hugo fish rsync coreutils findutils ffmpeg

# Casks
brew cask install 1password hammerspoon monolingual tunnelblick
brew cask install android-platform-tools java musescore vlc caffeine launchbar
brew cask install transmission the-unarchiver suspicious-package app-cleaner
brew cask install firefox karabiner-elements macdown veracrypt google-chrome
brew cask install emacs

# Fonts
brew cask install font-eb-garamond font-fira-code font-hasklig
brew cask install font-inconsolata font-lora font-open-sans
brew cask install font-roboto font-roboto-mono
brew cask install font-source-code-pro-for-powerline
brew cask install font-ubuntu

# Cleanup
brew cleanup -s
brew cask cleanup
