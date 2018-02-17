--
-- Expose replacement
--

local mod = {}
mod.config = {
	-- Shortcut for all windows hint
	exposeSpaceKey = { "⌘⌃", "m" },
}

function mod.init()
  local expose_space = hs.expose.new(nil,{includeOtherSpaces=false, showThumbnails=true})
  bind(mod.config.exposeSpaceKey, function() expose_space:toggleShow() end)
end

return mod