local mod = {}
mod.config = {
	nextKey = {"ctrl", "w"},
	prevKey = {"ctrl", "v"},
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

	hs.hotkey.bind(cfg.nextKey[1], cfg.nextKey[2], nextWindow, nil, nil)
	hs.hotkey.bind(cfg.prevKey[1], cfg.prevKey[2], prevWindow, nil, nil)
end

return mod