local mod = {}
mod.config = {
	keyMode = {"", "s"},

	keySleep = "s",
	keyLock = "l",
	keyRestart = "r",
	keyShutdown = "d",
}

local modeSystem

function mod.init()
	modeSystem = Mode.new("System", mod.config.keyMode, {global = false, display = true})

	local c = hs.caffeinate
	local cf = mod.config

	modeSystem:bindKeyOnly(cf.keySleep, "Sleep immediately", function() c.systemSleep() end)
	modeSystem:bindKeyOnly(cf.keyLock, "Lock screen", function() c.lockScreen() end)
	modeSystem:bindKeyOnly(cf.keyRestart, "Restart", function() c.restartSystem() end)
	modeSystem:bindKeyOnly(cf.keyShutdown, "Shutdown", function() c.shutdownSystem() end)
end

return mod