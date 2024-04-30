fish_add_path ~/.cargo/bin

# Starship prompt
if type -q starship
	starship init fish | source
end

alias ls="eza"
alias ll="eza -lh"
alias la="eza -lah"
alias dotfile="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# opam configuration
if test -e $HOME/.opam/opam-init/init.fish
	source /home/isaackhor/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end
