# Set up environment

set EDITOR vim
set BOOT_JVM_OPTIONS '-XX:MaxMetaspaceSize=128m -Xms256m -Xmx512m -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none'
#set PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
#set PATH ~/dotfiles/scripts $PATH
#set PATH ~/bin $PATH

# Virtualfish - virtualenv integration
#set VIRTUALFISH_HOME ~/.config/virtualenv
#set VIRTUALFISH_PYTHON_EXEC /usr/local/bin/python3

# iTerm2 integration
#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

