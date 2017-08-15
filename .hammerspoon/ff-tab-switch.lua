local mod = {}
mod.config = {
  specialApps =
  {["Firefox"] = true,
   ["Sublime Text"] = true}
}

--
-- Keybindings
--

function frontmostApp()
    return hs.application.frontmostApplication()
end

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
  -- Change it for firefox
  hs.hotkey.bind("ctrl", "s",
    function() changeIfSpecial({"ctrl", "s"}, {"ctrl", "tab"}) end)
  hs.hotkey.bind("ctrl", "n",
    function() changeIfSpecial({"ctrl", "n"}, {"ctrl,shift", "tab"}) end)
end

return mod