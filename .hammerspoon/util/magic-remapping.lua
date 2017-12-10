local mod = {}
mod.config = {
}

function postKey(mods, key)
  mods = mods or {}

  return function()
    hs.eventtap.event.newKeyEvent(mods, key, true):post()
    hs.eventtap.event.newKeyEvent(mods, key, false):post()
  end
end

function mod.init()
  hs.hotkey.bind('ctrl,cmd', 's', postKey('cmd,shift', ']'), 
    nil, postKey('cmd,shift', ']'))
  hs.hotkey.bind('ctrl,cmd', 'n', postKey('cmd,shift', '['), 
    nil, postKey('cmd,shift', '['))

  hs.hotkey.bind('cmd', 'h', postKey('cmd,shift,alt,ctrl', 'f12'), 
    nil, postKey('cmd,shift,alt,ctrl', 'f12'))
end

return mod
