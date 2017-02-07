local mod = {}
mod.config = {}

local showHsConsole = {
	text = "Show Hammerspoon console",
	id = "show-hs-console",
	onTriggerFn = function()
		hs.openConsole()
	end
}

local reloadConfig = {
	text = "Reload config",
	id = "reload-hs-config",
	onTriggerFn = function()
		hs.reload()
	end
}

function mod.init()
	cmdLineMaster.registerNewChoice(showHsConsole)
	cmdLineMaster.registerNewChoice(reloadConfig)
end

return mod