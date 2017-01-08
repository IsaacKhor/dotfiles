local mod = {}
mod.config = {
	key = {"", "h"}
}

local modeHs = Mode.new("Hammerspoon", mod.config.key, {global = false, display = true})

function mod.init()
	modeHs:bindKeyOnly("c", "Console", function() hs.openConsole() end)
	modeHs:bindKeyOnly("r", "Reload config", function() hs.reload() end)
end

return mod