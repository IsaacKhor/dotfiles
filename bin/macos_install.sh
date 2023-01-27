#!/usr/bin/env zsh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew_formulae=(
bat
coreutils
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
)

brew_casks=(
1password
1password-cli
alfred
battery
dash
font-roboto-mono
google-chrome
hiddenbar
iterm2
karabiner-elements
little-snitch
mactex
micro-snitch
shottr
sublime-text
texifier
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

