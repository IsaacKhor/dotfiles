require("utils")
require("glove80_autoload")
require("hs.ipc")

hs.console.clearConsole()
hs.loadSpoon('EmmyLua')

-- Keybindings

hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'f2', SwitchOrCycleApp('com.microsoft.VSCode'))
hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'f1', SwitchOrCycleApp('org.mozilla.firefox'))
hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'f3', SwitchOrCycleApp('com.googlecode.iterm2'))

-- Window hints
hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'f5', hs.hints.windowHints)
hs.hints.style = 'vimperator'
hs.hints.showTitleThresh = 8

hs.hotkey.bind({}, 'f9', SendKey({ 'cmd', 'shift' }, '['))
hs.hotkey.bind({}, 'f10', SendKey({ 'cmd', 'shift' }, ']'))

Notify('Hammerspoon', 'Config loaded successfully')
