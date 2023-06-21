#!/usr/bin/env bash

set -euo pipefail

# Set up dotfiles
git clone --bare https://github.com/IsaacKhor/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'

mkdir -p .config-backup
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
fi;

sudo apt -y install fish exa fzf
sudo snap install --edge starship

