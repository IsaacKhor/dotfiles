require("utils")
require("glove80_autoload")
require("hs.ipc")

-- local arrange = require("arrange")
local arrange = require("arrange")
arrange.loadConfig()

hs.console.clearConsole()
hs.loadSpoon('EmmyLua')
hs.loadSpoon('SpoonInstall')

-- Keybindings

hs.hotkey.bind({ 'cmd', 'alt', 'ctrl', 'shift' }, 'f7', SwitchOrCycleApp('com.microsoft.VSCode'))
hs.hotkey.bind({ 'cmd', 'alt', 'ctrl', 'shift' }, 'f6', SwitchOrCycleApp('org.mozilla.firefox'))
hs.hotkey.bind({ 'cmd', 'alt', 'ctrl', 'shift' }, 'f5', SwitchOrCycleApp('com.googlecode.iterm2'))

-- Window hints
-- hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'f5', hs.hints.windowHints)
hs.hints.style = 'vimperator'
hs.hints.showTitleThresh = 8

-- hs.hotkey.bind({}, 'f9', SendKey({ 'cmd', 'shift' }, '['))
-- hs.hotkey.bind({}, 'f10', SendKey({ 'cmd', 'shift' }, ']'))

-- Standard window layouts
-- hs.hotkey.bind({ 'cmd', 'alt', 'ctrl', 'shift' }, 'y', arrange.userChoose)

Notify('Hammerspoon', 'Config loaded successfully')
