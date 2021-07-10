#!/bin/bash

set -euo pipefail

# Configure ZSH
echo 'Configuring ZSH'
curl -sfL git.io/antibody | sh -s - -b ~/bin
~/bin/antibody bundle < zsh/zsh_plugins.txt > zsh/zsh_plugins.sh
ln -sfFn ~/code/dotfiles/zsh/.zshrc ~/.zshrc

# Configure tmux
echo 'Configuring tmux'
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sfFn ~/code/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfFn ~/code/dotfiles/.tmuxline_snapshot ~/.tmuxline_snapshot
echo 'Remember to <C-b> + I to install tmux plugins'

# Misc
ln -sfFn ~/code/dotfiles/.wgetrc ~/.wgetrc
