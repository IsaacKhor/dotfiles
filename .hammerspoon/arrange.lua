local module = {}

module.arrangements = {}
module.configFile = hs.configdir .. "/arrangements.json"

function module.loadConfig()
	local config = hs.json.read(module.configFile)
	if config then
		module.arrangements = config
	end
end

function module.saveConfig()
	return hs.json.write(module.arrangements, module.configFile, true, true)
end

function module.getSpaceArrangement()
	local arrangement = {}
	for _, v in pairs(hs.screen.allScreens()) do
		local monitorUUID = v:getUUID()

		arrangement[monitorUUID] = {}
		arrangement[monitorUUID]['Monitor Name'] = v:name()
		arrangement[monitorUUID]['apps'] = {}

		local windows = hs.window.filter.new(true)
			:setCurrentSpace(true)
			:setScreens(v:getUUID())
			:getWindows()

		for k, wv in pairs(windows) do
			arrangement[monitorUUID]['apps'][wv:application():title()] = {}

			-- wv:focus()

			if k == 1 then
				arrangement[monitorUUID]['Monitor Name'] = v:name()
			end

			for i, t in pairs(wv:frame()) do
				local attribute = string.gsub(i, '_', '')
				arrangement[monitorUUID]['apps'][wv:application():title()][attribute] = t
			end
		end
	end

	return arrangement
end

function module.setSpaceArrangement(arrangement)
	for monitorUUID, monitorDetails in pairs(arrangement) do
		if hs.screen.find(monitorUUID) ~= nil then
			for appName, position in pairs(monitorDetails['apps']) do
				local app = hs.application.get(appName)
				if app ~= nil then
					local windows = hs.window.filter.new(appName):getWindows()
					for _, w in pairs(windows) do
						w:moveToScreen(monitorUUID)
						w:setFrame(position, 0)
					end
				end
			end
		end
	end
end

function module.addArrangement()
	local btn, name = hs.dialog.textPrompt(
		'Arrangement Name',
		'Enter a name for this arrangement',
		'New Arrangement',
		'OK', 'Cancel')
	if btn == 'OK' and name ~= '' then
		module.arrangements[name] = module.getSpaceArrangement()
		module.saveConfig()
	end
end

function module.userChoose()
	hs.chooser.new(function(choice)
		if choice == nil then
			return
		end
		if choice['text'] == 'New Arrangement' then
			module.addArrangement()
		else
			module.setSpaceArrangement(module.arrangements[choice['text']])
		end
	end):choices(function()
		local choices = {}

		-- Entries in alphabetical order
		local tkeys = {}
		for k in pairs(module.arrangements) do table.insert(tkeys, k) end
		table.sort(tkeys)

		for _, k in ipairs(tkeys) do
			table.insert(choices, { text = k })
		end

		table.insert(choices, { text = 'New Arrangement' })
		return choices
	end):show()
end

return module
