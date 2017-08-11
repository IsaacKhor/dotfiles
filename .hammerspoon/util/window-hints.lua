--
-- Window manipulation
--

local mod = {}
mod.config = {
	-- Shortcut for all windows hint
	allWinKey = { "⌃", "d" },
	-- Shortcut for hint for active app only
	activeAppKey = { "⌃⇧", "d" },
	-- Hints style
	-- use 'vimperator' if you want the hint char to be the
	-- first letter of the window title
	style = "default",
}

-- Show window hints for the active application
function activeAppHints()
	local windows = hs.window.focusedWindow():application():allWindows()
	hs.hints.windowHints(windows, nil, nil)
end

function mod.init()
	hs.hints.style = mod.config.style

	-- Show window titles if there are less than x windows
	-- 0 to disable
	hs.hints.showTitleThresh = 4

	-- Must use fully-qualified name of the font according to the docs
	hs.hints.fontName = "Inconsolata-Regular"
	hs.hints.fontSize = 24

	-- Show window hints for all windows
	bind(mod.config.allWinKey, hs.hints.windowHints)

	-- Hints for active app only
	-- Disabled while vimperator mode is active
	if not mod.config.style == "vimperator" then
		bind(mod.config.activeAppKey, activeAppHints)
	end
end

return mod