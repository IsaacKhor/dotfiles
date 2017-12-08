#!/usr/bin/env fish

set brew_packages '
autoconf	freetype	lame		mysql		sbcl
automake	gd		ldns		nasm		scala
bdw-gc		gdbm		leiningen	nmap		sphinx-doc
boot-clj	gettext		libffi		node		sqlite
clisp		git-flow	libpng		openssl		swi-prolog
cmake		gmp		libsigsegv	openssl@1.1	swig
coreutils	go		libsodium	pcre		testdisk
datomic		govendor	libssh2		pcre2		texi2html
dnscrypt-proxy	gradle		libtiff		pkg-config	webp
duti		graphviz	libtool		planck		wget
ecl		haskell-stack	libyaml		postgresql	x264
elm		heroku		libzip		python3		xvid
ffmpeg		hugo		lua		readline	xz
findutils	icu4c		lumo		rsync		yasm
fish		iperf		makedepend	ruby
fontconfig	jpeg		minisign	rust
'

set brew_cask_packages '
1password                                iterm2
anaconda                                 java
android-platform-tools                   karabiner-elements
appcleaner                               keybase
atom                                     launchbar
caffeine                                 launchcontrol
emacs                                    lighttable
firefoxdeveloperedition                  liya
font-eb-garamond                         macdown
font-fira-code                           monolingual
font-hasklig                             musescore
font-hasklig-nerd-font                   opera
font-inconsolata                         osxfuse
font-lora                                qlstephen
font-open-sans                           suspicious-package
font-roboto                              the-unarchiver
font-roboto-mono                         torbrowser
font-source-code-pro                     transmission
font-source-code-pro-for-powerline       tunnelblick
font-ubuntu                              ukelele
gitup                                    veracrypt
google-chrome                            vlc
google-cloud-sdk                         webtorrent
hammerspoon
'

# Taps
brew tap caskroom/fonts
brew tap caskroom/versions

echo -e '\n\n
==============================
== Installing brew packages ==
=============================='
brew install $brew_packages

echo -e '\n\n
===================================
== Installing brew-cask packages ==
==================================='
brew cask install $brew_cask_packages