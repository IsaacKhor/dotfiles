#!/usr/bin/env bash

set -euo pipefail

# Set up dotfiles
git clone --bare https://github.com/IsaacKhor/dotfiles.git ~/.dotfiles

function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p .config-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
dotfiles checkout

# Install and update misc utilities
echo 'Configuring ZSH'
curl -L git.io/antigen > ~/bin/antigen.zsh

echo 'Configuring tmux'
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
