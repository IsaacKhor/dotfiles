function cleanup
  find . -type f -name '*.DS_Store' -delete
  find . -type f -name 'Icon?' -delete
  brew cleanup -s
  brew cask cleanup
end