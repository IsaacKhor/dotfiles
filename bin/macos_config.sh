# disable animation for dock autohide and show
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.Dock autohide-time-modifier -float 0

# default column view
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
# show finder path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"
# show folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
# show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
# disable warning on changing extensions
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# don't offer new attached disks for time machine backup
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# disable screenshow window shadow
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# use fn
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
# show file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# switch to space with active windows
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "false"
# keys repeat when held down
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

killall Finder
killall Dock

