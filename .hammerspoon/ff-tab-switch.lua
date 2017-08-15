local mod = {}
mod.config = {
  specialApps =
  {["Firefox"] = true,
   ["Sublime Text"] = true}
}

--
-- Keybindings
--

-- Change the keybinding for special apps that don't deal with the native
-- system controls

function frontmostApp()
    return hs.application.frontmostApplication()
end

-- Poor man's version of (contains? collection element)
-- by storing the names in the keys
function isSpecial(appName)
  return mod.config.specialApps[appName] ~= nil
end

function changeIfSpecial(orig, change)
  if(isSpecial(frontmostApp():title())) then
    emitKey(change[1], change[2])
  else
    emitKey(orig[1], orig[2])
  end
end

function mod.init()
  hs.hotkey.bind("ctrl", "s",
    function() changeIfSpecial({"ctrl,alt,shift,cmd", "f1"}, {"ctrl", "tab"}) end)
  hs.hotkey.bind("ctrl", "n",
    function() changeIfSpecial({"ctrl,alt,shift,cmd", "f2"}, {"ctrl,shift", "tab"}) end)
end

return mod