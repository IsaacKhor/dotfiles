-- Window management

local mod = {}
mod.config = {
	key = {"", "w"}
}

local modeWindow

local function bindMod(mod, key, desc, f)
	local msg = mod .. "+" .. key .. ": " .. desc
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

local function fillScreen(max, f)
	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	return f
end

function mod.init()
	modeWindow = Mode.new("Window management", mod.config.key, {global = false, display = true})

	local m = modeWindow

	m:bindKeyOnly('c', "Centre window", getWinFunc(centreWindow), false)
	m:bindKeyOnly('f', "Fill screen", getWinFunc(fillScreen))

	bindMod('shift', 'h', "Left half", getWinFunc(leftHalf))
	bindMod('shift', 's', "Right half", getWinFunc(rightHalf))
end

return mod