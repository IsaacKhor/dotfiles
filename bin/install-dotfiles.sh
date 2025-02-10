#!/usr/bin/env bash
set -xeuo pipefail

# Set up dotfiles
git clone --bare https://github.com/IsaacKhor/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'

mkdir -p .config-backup
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout || true
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
fi;

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote set-url origin git@github.com:IsaacKhor/dotfiles.git

sudo apt -y install fish fzf gpg

# setup rust toolchain
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#cargo install eza starship

curl -sS https://starship.rs/install.sh | sh
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

