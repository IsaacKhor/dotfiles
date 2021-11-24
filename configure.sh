#!/bin/bash

set -euo pipefail

# Configure ZSH
echo 'Configuring ZSH'
curl -sfL git.io/antibody | sh -s - -b ~/bin
~/bin/antibody bundle < zsh_plugins.txt > zsh_plugins.sh
ln -sfFn ~/code/dotfiles/zshrc ~/.zshrc

# Configure tmux
echo 'Configuring tmux'
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sfFn ~/code/dotfiles/tmux.conf ~/.tmux.conf
echo 'Remember to <C-b> + I to install tmux plugins'

# Misc
ln -sfFn ~/code/dotfiles/wgetrc ~/.wgetrc

# git repos
git clone https://github.com/IsaacKhor/worldbot.git
git clone https://github.com/IsaacKhor/rsbots.git
git clone https://github.com/IsaacKhor/athena.git
git clone https://github.com/IsaacKhor/ukprstatic.git
git clone https://github.com/IsaacKhor/zhongxin-source.git
git clone https://github.com/IsaacKhor/blog-source.git
git clone https://github.com/IsaacKhor/scheme-c.git
