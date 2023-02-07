HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
setopt nomatch
setopt notify
setopt auto_cd
setopt share_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
unsetopt beep # No beeping
bindkey -e # Emacs/readline keybindings

export PATH=~/bin:$PATH
export EDITOR=vim
export VISUAL=vim
export PATH=~/.local/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=python3

alias ll='ls -lh --color=always'
alias la='ls -lah --color=always'
alias dotfile='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Completions
autoload -Uz compinit
compinit

zmodload zsh/complist

unsetopt menu_complete # Don't autoselect first completion
setopt auto_menu # Open menu completion after pressing tab a few times
setopt always_to_end

zstyle ':completion:*' 				menu select
zstyle ':completion:*' 				group-name ''
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' 	format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' 	 	command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:manuals'    	separate-sections true
zstyle ':completion:*:manuals.*'  	insert-sections   true
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Plugins
source ~/bin/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Source host-specific config files
if [[ -f ~/.config/zsh/.zshrc.$(hostname -s) ]]; then
  source ~/.config/zsh/.zshrc.$(hostname -s)
fi

# Attach to tmux session if we're not in one over ssh
#if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
#    [[ -z "${TMUX}" ]] && tmux new-session -A -s default
#fi

#source ~/.local/bin/virtualenvwrapper.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# opam configuration
[[ ! -r /Users/isaackhor/.opam/opam-init/init.zsh ]] || source /Users/isaackhor/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
