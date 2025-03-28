if not status --is-interactive
	exit
end

# Starship prompt
if type -q starship
	starship init fish | source
end

alias dotfile="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

fish_add_path -g ~/bin

# opam configuration
if test -e $HOME/.opam/opam-init/init.fish
	source /home/isaackhor/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

if test -e /opt/homebrew
	fish_add_path -g /opt/homebrew/bin
end

if test -e ~/.cargo
	fish_add_path -g ~/.cargo/bin
end

if type -q fzf
	fzf_key_bindings
end

if test -e ~/.atuin
	fish_add_path -g ~/.atuin/bin
	atuin init fish --disable-up-arrow | source
	#bind \cr _atuin_search
end

if test -e ~/perl5
	fish_add_path -g ~/perl5/bin
	eval (perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
end

if type -q starship
	starship init fish | source
end

if type -q eza
	alias ls="eza"
	alias ll="eza -lh"
	alias la="eza -lah"
end

if test -e ~/.vcpkg
	set -x VCPKG_ROOT ~/.vcpkg
	fish_add_path -g ~/.vcpkg
end

# source machine local config if one exists
if test -e ~/.config/fish/config.$hostname
	source ~/.config/fish/config.$hostname
end

