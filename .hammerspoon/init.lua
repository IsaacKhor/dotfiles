package.path = package.path .. ';plugins/?.lua'

--
-- Global variables
--

logger = hs.logger.new("core", "info")

modal_list = {}
modes = {}

--
-- Global config
--

-- Set default alert font size and rounded corner radius
hs.alert.defaultStyle.textSize = 16
hs.alert.defaultStyle.radius = 12

-- Plugin config and loading

local plugins = {
    {"util.config-reload", {}},

    -- Modes
    {"Mode", {}},
    {"modes.master", {}},
    {"modes.vim", {}},
    {"modes.hammerspoon", {}},
    {"modes.system", {}},

    -- Utilities    
    {"util.window-hints", {}},
    {"util.cheatsheet", {}},
}

local function loadPlugin(plugin, config)
    local mod = require(plugin)

    -- Proper modules should return tables
    if type(mod) == "table" then
        -- Create config if one doesn't exist
        if not mod.config then
            mod.config = {}
        end

        -- Config can be nil
        if not config then
            config = {}
        end

        -- Override default config
        for k,v in pairs(config) do
            mod.config[k] = v
        end

        -- Call init if it exists
        -- Initialiser should be in a special function because
        -- we might change config which will affect initialisation
        if type(mod.init) == "function" then
            mod.init()
        end
    end
end

local function loadPlugins(plugins)
    for i = 1, #plugins do
        loadPlugin(plugins[i][1], plugins[1][2])
    end
end

-- A bind that works with config
function bind(key, func)
    hs.hotkey.bind(key[1], key[2], func)
end

function notify(header, text)
    hs.notify.new({title = header, informativeText = text}):send()
end

function prettyPrint(obj)
    print(hs.inspect.inspect(obj))
end

function alert(msg)
    hs.alert.show(msg)
end

function emitKey(mod, key)
    hs.eventtap.keyStroke(mod, key, 1000)
end

loadPlugins(plugins)

--
-- Keybindings
--

hs.hotkey.bind("ctrl", "s", function() emitKey("ctrl", "tab") end)
hs.hotkey.bind("ctrl", "n", function() emitKey("ctrl,shift", "tab") end)


--
-- Everything successful
--

notify("Hammerspoon", "Config loaded successfully")