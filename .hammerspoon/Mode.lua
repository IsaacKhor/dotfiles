local modeMaster = require("modes.master")

Mode = {}
Mode.__index = Mode

Mode.config = {
	hintW = 600,
	hintH = 800,

	keyManager = {"ctrl", "m"}
}

Mode.modes = {}

local activeMode = nil
local showCommandsActive = false
local showCommandsMode = nil

-- Creates a new mode
--
-- Params
-- * name: name of the mode; will be displayed in the command palettte
-- * enterKey: table with 2 elems {mod, key}; if global is false, modifiers are ignored
--             if global is true, binds the entrance of the mode to the args
-- * options: a table of options; possible values: display, global
-- 		* global: if true, a global hotkey will be bound with enterKey
-- 		* display: if true, hints will be display on entrance to the mode, and exit the mode
--                 if a shortcut is pressed
function Mode.new(name, enterKey, options)
	local opts = options or {}

	logger.i("New mode: ", name)

	local mode =  setmetatable({
		name = name or "No Name",
		enterKey = enterKey or {"", ""},
		keybindings = {},
		display = opts.display or false,
		global = opts.global or false,
		hsmode = hs.hotkey.modal.new(),
		hotkeytext = nil,
		hotkeybg = nil,
	}, Mode)

	if mode.global then
		hs.hotkey.bind(enterKey[1], enterKey[2], nil, function() mode.hsmode:enter() end)
	end

	-- Add to mode manager
	modeMaster.registerMode(mode)

	mode:addDefaultsToMode()

	table.insert(Mode.modes, mode)

	return mode
end

function Mode.setActiveMode(active)
	-- for _,mode in pairs(Mode.modes) do
	-- 	if active ~= mode then
	-- 		mode:exit()
	-- 	end
	-- end

	activeMode = mode
end

-- Binds a new command to the mode
--
-- Params:
-- * mod: modifier key for binding
-- * key: actual key for binding
-- * msg: description of the binding
-- * alert: if true, msg will be shown on trigger of the command
-- * func: the function executed on trigger of command
function Mode:bind(mod, key, msg, alert, pressFunc, releaseFunc, repeatFunc)
	table.insert(
		self.keybindings, 
		{mod = mod,
		key = key, 
		msg = msg, 
		alert = alert, 
		func = func}
	)

	local realFunc = func

	local function wrapFunc(fn)
		-- If it was nil, neturn nothing to make sure that 
		-- hammerspoon doesn't get confused

		if not fn then
			return nil
		end

		if alert then
			return function()
				self:showCommands(false)
				fn()
				self:exit()
			end
		else
			return function()
				self:showCommands(false)
				fn()
			end
		end
	end

	local wPressFn = wrapFunc(pressFunc)
	local wRelFn = wrapFunc(releaseFunc)
	-- Don't need to wrap repeat func
	local wRepFn = repeatFunc

	-- Workaround: if 3rd param is nil, it will be interpreted as missing pressedFn
	-- source: https://github.com/Hammerspoon/hammerspoon/blob/master/extensions/hotkey/init.lua
	if alert then
		self.hsmode:bind(mod, key, msg, wPressFn, wRelFn, wRepFn)
	else
		self.hsmode:bind(mod, key, wPressFn, wRelFn, wRepFn)
	end
end

function Mode:bindKeyOnly(key, msg, func, rep)
	local realRepFn = nil
	local rep = rep or false

	if rep then
		realRepFn = func
	end

	self:bind("", key, key .. ": " .. msg, false, func, nil, realRepFn)
end

function Mode:addDefaultsToMode()
	local hsmode = self.hsmode

	self:bindKeyOnly("q", "Exit mode", function() hsmode:exit() end)
	--mode:bindKeyOnly("escape", "Exit mode", function() hsmode:exit() end)
	local function toggleShowCommands()
		if self.hotkeytext then
			showCommands(false)
		else
			showCommands(true)
		end
	end

	self:bindKeyOnly("tab", "Show commands", toggleShowCommands)

	local mode = self
	function hsmode:entered()
		Mode.setActiveMode(mode)

		-- Don't show both the commands and the alert; if the command palette is up
		-- the user probably knows that they are in a special mode
		if mode.display then
			mode:showCommands(true)
		else
			hs.alert("Entre: " .. mode.name, 0.5)
		end
	end
	function hsmode:exited()
		-- Don't alert since every single mode who exited will want to display an alert
		--hs.alert("EXIT: " .. mode.name, 0.5)
		mode:showCommands(false)
	end
end

function Mode:enter() self.hsmode:enter() end
function Mode:exit() self.hsmode:exit() end

function Mode:showCommands(set)
	local keybindings = self.keybindings
	local hotkeytext = self.hotkeytext
	local hotkeybg = self.hotkeybg

	local function show()
		local mainScreen = hs.screen.mainScreen()
        local max = hs.screen.mainScreen():frame()

		local xpos = (max.w / 2) - (Mode.config.hintW / 2)
		local ypos = (max.h / 2) - (Mode.config.hintH / 2)

        local hkbgrect = hs.geometry.rect(xpos,ypos,Mode.config.hintW,Mode.config.hintH)

        hotkeybg = hs.drawing.rectangle(hkbgrect)
        -- hotkeybg:setStroke(false)
        hotkeybg:setFillColor({red=0,blue=0,green=0,alpha=0.75})
        hotkeybg:setRoundedRectRadii(10,10)
        hotkeybg:setLevel(hs.drawing.windowLevels.modalPanel)
        hotkeybg:setBehavior(hs.drawing.windowBehaviors.stationary)
        local hktextrect = hs.geometry.rect(hkbgrect.x+40,hkbgrect.y+30,hkbgrect.w-80,hkbgrect.h-60)

        hotkeytext = hs.drawing.text(hktextrect,"")
        hotkeytext:setLevel(hs.drawing.windowLevels.modalPanel)
        hotkeytext:setBehavior(hs.drawing.windowBehaviors.stationary)
                
        local availablelen = 90
        local hkstr = ''
        
        for i=1, #keybindings do
            hkstr = hkstr .. keybindings[i].msg .. '\n'
        end
        
        local hkstr_styled = hs.styledtext.new(hkstr, {
        	font = {name="Courier-Bold",size=16}, 
	    	color = white, 
	    	paragraphStyle = {lineSpacing=12.0,lineBreak='truncateMiddle'}})
        
        hotkeytext:setStyledText(hkstr_styled)
        hotkeybg:show()
        hotkeytext:show()

        self.hotkeytext = hotkeytext
        self.hotkeybg = hotkeybg
    end

    local function hide()
    	hotkeytext:delete()
        self.hotkeytext=nil
        hotkeybg:delete()
        self.hotkeybg=nil
    end

    if set then
    	if hotkeytext then
    		hide()
    	end
		show()
    else
    	if hotkeytext then
			hide()
    	end
    end
end

setmetatable(Mode, { __call = function(_, ...) return Mode.new(...) end })

return Mode