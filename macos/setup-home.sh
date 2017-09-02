#!/usr/bin/env bash

cd ~/Documents

# Set up and link dotfiles
git clone https://github.com/ClarenceClark/dotfiles.git

ln -s ~/Documents/dotfiles/fish/ ~/.config/fish
ln -s ~/Documents/dotfiles/karabiner/ ~/.config/karabiner
ln -s ~/Documents/dotfiles/.hammerspoon/ ~/.hammerspoon
ln -s ~/Documents/dotfiles/.gitignore ~/.gitignore
ln -s ~/Documents/dotfiles/.wgetrc ~/.wgetrc
ln -s ~/Documents/dotfiles/.iterm2_shell_integration.fish ~/.iterm2_shell_integration.fish

# Code
mkdir code
cd code

# Various projects
git clone https://github.com/ClarenceClark/project-clarentine.git
git clone https://github.com/ClarenceClark/blog-source.git

# Apps in development
git clone https://github.com/ClarenceClark/stm-android.git
git clone https://github.com/ClarenceClark/stm-server.git
git clone https://github.com/ClarenceClark/stm-webui.git

git clone https://github.com/ClarenceClark/rmnt-webui.git
git clone https://github.com/ClarenceClark/rmnt-server.git
git clone https://github.com/ClarenceClark/rmnt-android.git