--
-- Window manipulation
--

local mod = {}
mod.config = {
	-- Shortcut for all windows hint
	allWinKey = { "⌃", "d" },
	-- Shortcut for hint for active app only
	activeAppKey = { "⌃", "b" },
	-- Hints style
	style = "vimperator",
}

-- Show window hints for the active application
function activeAppHints()
	local windows = hs.window.focusedWindow():application():allWindows()
	hs.hints.windowHints(windows, nil, nil)
end

function mod.init()
	hs.hints.style = mod.config.style

	-- Show window hints for all windows
	bind(mod.config.allWinKey, hs.hints.windowHints)

	-- Hints for active app only
	-- Disabled while vimperator mode is active
	if not mod.config.style == "vimperator" then
		bind(mod.config.activeAppKey, activeAppHints)
	end
end

return mod