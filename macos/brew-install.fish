#!/usr/bin/env fish

set brew_packages '
autoconf  fish         heroku    libtiff  pcre      sqlite
automake  fontconfig     hugo    libtool  pcre2     swig
bdw-gc    freetype       icu4c     libyaml  pkg-config  testdisk
boot-clj  gd         iperf     libzip planck      texi2html
clisp   gdbm         jpeg    lua    postgresql  webp
cmake   gettext        lame    lumo   python3     wget
coreutils git-flow       ldns    makedepend readline    x264
datomic   gmp        leiningen   minisign rsync     xvid
dnscrypt-proxy  go         libffi    mysql  ruby      xz
duti    govendor       libpng    nasm   rust      yasm
ecl   gradle         libsigsegv  node   sbcl
ffmpeg    graphviz       libsodium   openssl  scala
findutils haskell-stack  libssh2     openssl@1.1  sphinx-doc
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