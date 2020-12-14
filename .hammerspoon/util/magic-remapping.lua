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
  -- Syntax: bind(modifiers, key, message, pressedfn, releasedfn, repeatfn) 
  hs.hotkey.bind('', 'f9', 
    postKey('cmd,shift', '['), nil, postKey('cmd,shift', '['))
  hs.hotkey.bind('', 'f10', 
    postKey('cmd,shift', ']'), nil, postKey('cmd,shift', ']'))
end

return mod
