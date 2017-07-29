local mod = {}
mod.config = {}

local chooser = nil

local function chooseOption(choice)
	if not choice then return end

	local app = hs.appfinder.appFromName(choice.appName)
	if app then app:kill() end

	local keyfile = os.getenv("HOME") .. choice.keyfilePath
	os.remove(keyfile)

	if choice.restart then
		hs.application.open(choice.appName)
	end
end

local licenses = {
	{ text = "Ulysses",
	appName = "Ulysses Demo",
	keyfilePath = "/Library/Preferences/com.soulmen.ulysses3.reg",
	restart = true },
}

local choice = {
	text = "Software license reset",
	id = "software-license-reset",
	onTriggerFn = function() chooser:show() end,
}

function mod.init()
	cmdLineMaster.registerNewChoice(choice)

	chooser = hs.chooser.new(chooseOption)
	chooser:choices(licenses)
end

return mod