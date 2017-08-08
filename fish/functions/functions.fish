# Adapted from mathiasbynes' .aliases from his dotfiles repo

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias back='cd -'
function cdf
  cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
end

alias dl="cd ~/Downloads"
alias g="git"
alias h="history"
alias j="jobs"

# ls config

set LSCOLORS 'no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# List all files colorized in long format
alias l="ls -lF --color"

# List all files colorized in long format, including dot files
alias la="ls -laF --color"

# List only directories
alias lsd="ls -lF --color | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls --color"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

function update
  echo "Updating brews"
  brew update
  brew upgrade
  brew cleanup
  brew cask cleanup

  echo "Updating gems"
  echo "Since this uses sudo, plase enter your password:"
  sudo gem update --system
  sudo gem update
  sudo gem cleanup
end

function localip
  ipconfig getifaddr en0
end

function cleanup
  find . -type f -name '*.DS_Store' -delete
end

function empty-trash
  sudo rm -rfv /Volumes/*/.Trashes
  rm -rfv ~/.Trash
  sudo rm -rfv /private/var/log/asl/*.asl
  sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
end

function merge-pdf
  /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py
end

function afk
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

function mkd
  mkdir -p $argv and cd $argv
end

function start-http-server
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' 8000
end