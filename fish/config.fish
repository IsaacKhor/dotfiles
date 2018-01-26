# Set up environment

set EDITOR vimr
set BOOT_JVM_OPTIONS '-XX:MaxMetaspaceSize=128m -Xms256m -Xmx512m -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none'
set PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
set PATH ~/dotfiles/scripts $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/bin $PATH

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
