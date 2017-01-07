-- Inspired by dbmrq/dotfiles
-- Reddit post: https://www.reddit.com/r/vim/comments/56twvs/modal_keybindings_everywhere_with_hammerspoon_mac/

-- VIM style modal bindings

require("Mode")

local mod = {}
mod.config = {
	shortcutNormal = {"ctrl", "v"}
}

local normalMode

-- Functions
local function left() emitKey("", "Left") end
local function right() emitKey("", "Right") end
local function up() emitKey("", "Up") end
local function down() emitKey("", "Down") end

local function nextWord() emitKey("alt", "Right") end
local function prevWord() emitKey("alt", "Left") end

local function bind(key, desc, f)
	normalMode:bindKeyOnly(key, desc, f)
end

function mod.init()
	normalMode = Mode.new("Normal mode", mod.config.shortcutNormal, {global = true, display = false})

	bind('h', "Left", left)
	bind('t', "Down", down)
	bind('n', "Up", up)
	bind('s', "Right", right)

	bind('w', "Next word", nextWord)
	bind('b', "Previous word", prevWord)
end

return mod