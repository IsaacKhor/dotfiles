local mod = {}
mod.config = {
}

function mod.init()
  hs.hotkey.bind("ctrl", "s", function() emitKey("cmd,shift", "]") end)
  hs.hotkey.bind("ctrl", "n", function() emitKey("cmd,shift", "[") end)
end

return mod
