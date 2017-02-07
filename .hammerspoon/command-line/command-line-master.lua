local mod = {}
mod.config = {
	modeKey = {'ctrl', 'b'}
}

local choices = {}
local chooser

local idToChoice = {}

-- Workaround for functions passed into registerNewChoice
-- being nulled

function mod.registerNewChoice(choice)
	-- Workaround for hs.chooser not happy with
	-- Lua functions being passed in
	idToChoice[choice.id] = choice.onTriggerFn
	choice.onTriggerFn = nil

	table.insert(choices, choice)
	chooser:refreshChoicesCallback()
end

local function onChoice(arg)
	if not arg then return end

	local fn = idToChoice[arg.id]
	fn(arg)
end

local function getChoices()
	return choices
end

local function triggerCommandLine()
	chooser:show()
end

function mod.init()
	chooser = hs.chooser.new(onChoice)
	chooser:choices(getChoices)

	bind(mod.config.modeKey, triggerCommandLine)
end

cmdLineMaster = mod
return mod