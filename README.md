# My personal dotfiles repo

Use at your own risk; I do not take responsibility when you computer catches on fire as a result of using this repo.

Contains:

1. `.hammerspoon/` legacy stuff I'm keeping around
2. `firefox/` userchrome and js for settigs I need to keep
3. `scripts/` misc collection of scripts
4. `windows10/`, `choco.ps` installs all the software, `winremaps.ahk` are my remaps
5. `zsh/` for zshrc and plugins
6. `tmux` for tmux.conf and plugins

The `configure.sh` script will:
1. Setup `zsh` along with plugins
2. Setup `tmux` along with plugins
3. Symlink a bunch of other useful files

## ZSH

My zsh config uses [Antibody](https://getantibody.github.io/) for plugin management. The configure script will install antibody, then plugins, then symlink zshrc
