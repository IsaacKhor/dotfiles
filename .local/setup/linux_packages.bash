#!/usr/bin/env bash
set -xeuo pipefail

sudo apt update
sudo apt -y install fish fzf gpg starship

# setup rust toolchain
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#cargo install eza starship

sudo apt update
sudo apt install -y eza

# docker
#sudo apt install -y docker.io docker-buildx docker-compose
#sudo usermod -aG docker $USER

# atuin
#curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

