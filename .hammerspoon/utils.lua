local geometry = require("hs.geometry")

local left40 = geometry.rect(0, 0, 0.4, 1)
local right60 = geometry.rect(0.4, 0, 0.6, 1)
local whole = geometry.rect(0, 0, 1, 1)

function ApplyDualLayout()
	local s1 = hs.screen.primaryScreen()
	local s2 = s1:next()

	if s2 == s1 or s2:rotate() ~= 270 then
		return
	end

	local layoutcode = {
		{ "org.mozilla.firefox",   nil, s1, right60, nil, nil },
		{ "com.googlecode.iterm2", nil, s1, left40,  nil, nil },
		{ "com.microsoft.VSCode",  nil, s2, whole,   nil, nil },
	}
	hs.layout.apply(layoutcode)
end

function Notify(header, text)
	hs.notify.new({ title = header, informativeText = text }):send()
end

function PrettyPrint(obj)
	print(hs.inspect.inspect(obj))
end

function Alert(msg)
	hs.alert.show(msg)
end

--- If the app is not in focus, switch to it. If it is, cycle between its
--- windows.
function SwitchOrCycleApp(appid)
	return function()
		local focusWin = hs.window.focusedWindow()
		if focusWin ~= nil and focusWin:application():bundleID() == appid then
			local allwins = focusWin:application():allWindows()
			allwins[#allwins]:focus()
			return
		else
			local app = hs.application.find(appid, false, false)
			local windows = app:allWindows()
			if #windows > 0 then
				windows[1]:focus()
				-- app:activate()
			end
		end
	end
end

function SendKey(mods, key)
	return function()
		hs.eventtap.keyStroke(mods, key)
	end
end
