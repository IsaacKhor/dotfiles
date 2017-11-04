function cleanup
  find . -type f -name '*.DS_Store' -delete
  brew cleanup -s
  brew cask cleanup
end