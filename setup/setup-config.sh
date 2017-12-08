#!/bin/bash

# Symlink everything

# Dotfiles
ln -sfFn ~/Documents/dotfiles/scripts/ ~/scripts
ln -sfFn ~/Documents/dotfiles/.wgetrc ~/.wgetrc
ln -sfFn ~/Documents/dotfiles/karabiner ~/.config/karabiner
ln -sfFn ~/Documents/dotfiles/fish ~/.config/fish
ln -sfFn ~/Documents/dotfiles/.hammerspoon ~/.hammerspoon
ln -sfFn ~/Documents/dotfiles/.emacs.d/ ~/.emacs.d/

# Home dir
ln -sfFn ~/Documents/.hidden/Home/* ~/
ln -sfFn ~/Documents/.hidden/.config ~/.config
ln -sfFn ~/Documents/.hidden/localshare ~/.local/share

ln -sfFn ~/Documents/.hidden/Google\ Drive/* ~/Documents

# Library
ln -sfFn ~/Documents/.hidden/Library/Application\ Support/* ~/Library/Application\ Support/
ln -sfFn ~/Documents/.hidden/Library/Container/* ~/Library/Container/
ln -sfFn ~/Documents/.hidden/Library/Preferences/* ~/Library/Preferences/