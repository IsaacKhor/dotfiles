function sysupdate
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

  echo "Updating python packages"
  pip3 list --outdated --format=freeze | cut -d = -f 1 | xargs -n1 pip3 install --upgrade
  pip2 list --outdated --format=freeze | cut -d = -f 1 | xargs -n1 pip2 install --upgrade
end