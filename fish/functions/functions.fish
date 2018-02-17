# Adapted from mathiasbynes' .aliases from his dotfiles repo

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias back='cd -'
function cdf
  cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
end

alias dl="cd ~/Downloads"
alias g="git"
alias h="history"
alias j="jobs"

# ls config
alias l 'exa -F'
alias ls 'exa -F'
alias ll 'exa -alF'
alias le 'exa -aRF'
alias lsd 'exa -lF | grep "^d"'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
