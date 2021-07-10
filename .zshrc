# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/clarence/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"

export PATH=~/.local/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=python3

source ~/.local/bin/virtualenvwrapper.sh

export EDITOR=vim
