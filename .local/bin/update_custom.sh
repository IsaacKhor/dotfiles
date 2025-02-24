#!/bin/bash

~/bin/antibody bundle < ~/.config/zsh/zsh_plugins.txt > "~/.config/zsh/zsh_plugins.$(hostname).sh"

# Install and update tpm plugins
~/.config/tmux/plugins/tpm/bin/install_plugins
~/.config/tmux/plugins/tpm/bin/update_plugins all

# Update antigen
curl -L git.io/antigen > antigen.zsh
