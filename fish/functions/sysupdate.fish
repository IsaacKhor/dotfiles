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
end