local mod = {}
mod.config = {
}

function mod.init()
  hs.hotkey.bind("ctrl,cmd", "s", function() emitKey("cmd,shift", "]") end)
  hs.hotkey.bind("ctrl,cmd", "n", function() emitKey("cmd,shift", "[") end)
end

return mod
