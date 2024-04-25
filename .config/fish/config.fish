fish_add_path ~/.cargo/bin

# Starship prompt
starship init fish | source

alias ls="eza"
alias ll="eza -lh"
alias la="eza -lah"
alias dotfile="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# opam configuration
if test -e $HOME/.opam/opam-init/init.fish
	source /home/isaackhor/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end
