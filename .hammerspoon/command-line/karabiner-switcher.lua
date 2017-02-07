require("lfs")

local mod = {}
mod.config = {
	profilesDir = os.getenv("HOME") .. "/Documents/dotfiles/karabiner/"
}

local cfg = mod.config
local chooser = nil

local function filenameFromPath(path)
	-- Matches everything until last '/', since + is eager
	-- then captures the rest, giving the filename
	return path:match("^.+/(.+)$")
end

local function switchToProfile(choice)
	if not choice then return end

	local dir = cfg.profilesDir
	local activeProfileName = dir .. "karabiner.json"

	os.remove(activeProfileName)
	-- IO for Lua sucks
	os.execute("cp " .. choice.url .. " " .. activeProfileName)
end

local function getAllProfiles()
	local ret = {}

	for file in lfs.dir(cfg.profilesDir) do
		prettyPrint(file)

		if file ~= ".DS_Store" or file ~= "karabiner.json" then
			local url = cfg.profilesDir .. file
			local mode = lfs.attributes(url, "mode")

			if mode == "file" then
				table.insert(ret, url)
			end
		end
	end

	return ret
end

local function getChoices()
	local choices = {}

	for i,f in pairs(getAllProfiles()) do
		table.insert(choices, {
			text = filenameFromPath(f),
			url = f,
			})
	end

	return choices
end

local masterChoice = {
	text = "Karabiner profiles",
	id = "karabiner-switcher",
	onTriggerFn = function() chooser:show() end,
}

function mod.init()
	cmdLineMaster.registerNewChoice(masterChoice)
	chooser = hs.chooser.new(switchToProfile)
	chooser:choices(getChoices)
end

return mod