#!/usr/bin/env bash
set -xeuo pipefail

sudo apt update
sudo apt -y install fish fzf gpg

# setup rust toolchain
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#cargo install eza starship

curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes
sudo mkdir -p /etc/apt/keyrings
sudo rm -rf /etc/apt/keyrings/gierens.gpg
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# docker
sudo apt install -y docker.io docker-buildx docker-compose
sudo usermod -aG docker $USER
