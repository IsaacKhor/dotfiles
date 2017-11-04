function empty-trash
  sudo rm -rf /Volumes/*/.Trashes/*
  rm -rf ~/.Trash/*
  sudo rm -rf /private/var/log/asl/*.asl
  sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
end