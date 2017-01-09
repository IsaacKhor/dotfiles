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

local function beginningOfLine() emitKey("cmd", "left") end
local function endOfLine() emitKey("cmd", "right") end
local function beginningOfText() emitKey("cmd", "up") end
local function endOfText() emitKey("cmd", "down") end

local function bind(key, desc, f)
	normalMode:bindKeyOnly(key, desc, f, true)
end

local function bindMod(mod, key, desc, f)
	local msg = mod .. "+" .. key .. ": " .. desc
	normalMode:bind(mod, key, msg, false, f, nil, f)
end

function mod.init()
	normalMode = Mode.new("Normal mode", mod.config.shortcutNormal, {global = true, display = false})

	bind('h', "Left", left)
	bind('t', "Down", down)
	bind('n', "Up", up)
	bind('s', "Right", right)

	bind('w', "Next word", nextWord)
	bind('b', "Previous word", prevWord)

	bindMod('shift', 'h', "Beginning of line", beginningOfLine)
	bindMod('shift', 's', "End of line", endOfLine)
	bindMod('shift', 'n', "Beginning of text", beginningOfText)
	bindMod('shift', 't', "End of text", endOfText)
end

return mod