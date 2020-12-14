local mod = {}
mod.config = {
	nextKey = {"⌘⌃", "s"},
	prevKey = {"⌘⌃", "n"},
}

local switcher = nil

function nextWindow()
	switcher:next()
end

function prevWindow()
	switcher:previous()
end

function mod.init()
	switcher = hs.window.switcher.new()
	local cfg = mod.config
	local ui = hs.window.switcher.ui

	ui.textSize = 14
	ui.thumbnailSize = 128
	ui.selectedThumbnailSize = 384
	ui.showSelectedTitle = false

	bind(cfg.nextKey, nextWindow)
	bind(cfg.prevKey, prevWindow)
end

return mod