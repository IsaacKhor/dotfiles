-- Window management

local mod = {}
mod.config = {
	keyMode = {"", "w"}
}

local modeWindow

local modToSym = {
	shift = '⇧',
	ctrl = '⌃',
	alt = '⌥',
	cmd = '⌘',
}

local function bindMod(mod, key, desc, f)
	local msg = modToSym[mod] .. key .. ": " .. desc
	modeWindow:bind(mod, key, msg, false, nil, f, nil)
end

local function newWinLocation(func)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local new = func(max, f)
	win:setFrame(new)
end

local function getWinFunc(func)
	return function()
		newWinLocation(func)
	end
end

local function centreWindow(max, f)
	f.x = (max.w / 2) - (f.w / 2)
	f.y = (max.h / 2) - (f.h / 2)
	return f
end

local function leftHalf(max, f)
	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	return f
end

local function rightHalf(max, f)
	f.x = max.w / 2
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	return f
end

local function centreXOnly(max, f)
	f.x = (max.w / 2) - (f.w / 2)
	return f
end

local function fillScreen(max, f)
	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	return f
end

function mod.init()
	modeWindow = Mode.new("Window management", mod.config.keyMode, {global = false, display = true})

	local m = modeWindow

	bindMod('shift', 'h', "Left half", getWinFunc(leftHalf))
	bindMod('shift', 's', "Right half", getWinFunc(rightHalf))
	m:bindKeyOnly('f', "Fill screen", getWinFunc(fillScreen))

	m:bindKeyOnly('c', "Centre window", getWinFunc(centreWindow))
	bindMod('shift', 'c', "Centre x only", getWinFunc(centreXOnly))
end

return mod