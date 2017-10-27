# Set up environment

set EDITOR vim
set BOOT_JVM_OPTIONS '-XX:MaxMetaspaceSize=128m -Xms256m -Xmx512m -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none'
set PATH "/usr/local/anaconda3/bin" "/Users/home/dotfiles/scripts" "/usr/local/sbin" "/usr/local/opt/coreutils/libexec/gnubin" $PATH

# bobthefish config options

set theme_color_scheme solarized-light
set theme_date_format "+%H:%M"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
