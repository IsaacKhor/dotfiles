---- Configuration file management
---- Copied directly from oh-my-hammerspoon

local mod={}
local configFileWatcher = nil

mod.config = {
   autoReload = true,
   manualReloadKey = {"⌘⌥⌃", "R"}
}

-- Automatic config reload if any files in ~/.hammerspoon change
function reloadConfig(files)
   doReload = false
   for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
         doReload = true
      end
   end
   if doReload then
      hs.reload()
   end
end

function mod.init()
   local hsConfigDir = os.getenv("HOME") .. "/.hammerspoon/"

   if mod.config.autoReload then
      logger.df("Setting up config auto-reload watcher on %s", hsConfigDir)
      configFileWatcher = hs.pathwatcher.new(hsConfigDir, reloadConfig)
      configFileWatcher:start()
   end

   -- Manual config reload
   bind(mod.config.manualReloadKey, hs.reload)
end

return mod