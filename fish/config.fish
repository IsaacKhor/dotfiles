# Set up environment

set EDITOR vimr
set BOOT_JVM_OPTIONS '-XX:MaxMetaspaceSize=128m -Xms256m -Xmx512m -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none'
set PATH "/usr/local/opt/coreutils/libexec/gnubin" "~/.local/bin" "~/Documents/dotfiles/scripts" $PATH

# bobthefish config options

set theme_color_scheme solarized-light
set theme_date_format "+%H:%M"
set theme_display_git_ahead_verbose yes
set theme_git_worktree_support yes
set theme_display_vagrant yes
set theme_display_docker_machine yes
set theme_display_hg yes
set theme_display_virtualenv yes
set theme_display_ruby yes
set theme_powerline_fonts yes
set theme_show_exit_status yes
set theme_newline_cursor yes

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
