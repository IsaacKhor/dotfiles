#!/usr/bin/env bash

cd ~/Documents

# Set up directory structure
mkdir code
git clone https://github.com/ClarenceClark/dotfiles.git
git clone https://github.com/ClarenceClark/blog-source.git

# Various projects
git clone https://github.com/ClarenceClark/project-clarentine.git

# Apps in development
git clone https://github.com/ClarenceClark/stm-android.git
git clone https://github.com/ClarenceClark/stm-server.git
git clone https://github.com/ClarenceClark/stm-webui.git

git clone https://github.com/ClarenceClark/remote-notificator-android.git

# Link all the dotfiles
ln -s dotfiles/fish/ ~/.config/fish
ln -s dotfiles/karabiner/ ~/.config/karabiner
ln -s dotfiles/.hammerspoon/ ~/.hammerspoon
ln -s dotfiles/.gitignore ~/.gitignore
ln -s dotfiles/.wgetrc ~/.wgetrc