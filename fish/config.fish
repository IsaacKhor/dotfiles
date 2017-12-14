# Set up environment

set EDITOR vim
set BOOT_JVM_OPTIONS '-XX:MaxMetaspaceSize=128m -Xms256m -Xmx512m -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none'
set PATH "/usr/local/sbin" "/usr/local/opt/coreutils/libexec/gnubin" "~/.local/bin" "~/Documents/dotfiles/scripts" $PATH

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
# set theme_display_user yes
set theme_display_vi yes
# set theme_avoid_ambiguous_glyphs yes
set theme_powerline_fonts yes
# set theme_nerd_fonts yes
set theme_show_exit_status yes
# set default_user your_normal_user
# set theme_color_scheme dark
# set fish_prompt_pwd_dir_length 0
# set theme_project_dir_length 1
set theme_newline_cursor yes

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
