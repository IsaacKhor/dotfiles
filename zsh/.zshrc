
# The following lines were added by compinstall
zstyle :compinstall filename '/home/clarence/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Env variables and aliases
export PATH=~/bin:$PATH
alias ll='ls -lh'
alias la='ls -lah'

source ~/code/dotfiles/zsh_plugins.sh

eval "$(starship init zsh)"

export PATH=~/.local/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=python3

source ~/.local/bin/virtualenvwrapper.sh

export EDITOR=vim
