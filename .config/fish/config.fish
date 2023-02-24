# Starship prompt
starship init fish | source

fish_add_path ~/.cargo/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin

alias ll="exa -lh"
alias la="exa -lah"
alias dotfile="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# opam configuration
if test -e $HOME/.opam/opam-init/init.fish
	source /home/isaackhor/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end
