local mod = {}
mod.config = {
	keyToggle = {"ctrl", "m"}
}

local modeMaster

function mod.init()
	modeMaster = Mode.new("Master", mod.config.keyToggle, {global = true, display = true})

	for _,mode in pairs(Mode.modes) do
		mod.registerMode(mode)
	end
end

function mod.registerEntry(key, name, func)
	if modeMaster then
		modeMaster:bindKeyOnly(key, name, func)
	end
end

function mod.registerMode(mode)
	mod.registerEntry(mode.enterKey[2], "Entre: "..mode.name, function() mode:enter() end)
end

return mod