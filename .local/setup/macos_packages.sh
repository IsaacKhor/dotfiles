#!/usr/bin/env zsh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew_formulae=(
bat
duf
dust
exa
fish
gcc
git
lf
ripgrep
rustup-init
starship
tmux
)

brew_casks=(
1password
alfred
battery
discord
firefox
font-source-code-pro-for-powerline
google-chrome
hammerspoon
hiddenbar
iterm2
karabiner-elements
little-snitch
menuwhere
moom
netnewswire
raycast
shortcat
shottr
slack
soundsource
tailscale
taskexlorer
texifier
the-unarchives
visual-studio-code
zoom
zotero
)

for f in $brew_formulae; do
    brew install $f
done

for c in $brew_casks; do
    brew install $c
done

