require("awful.autofocus")
awful       = require("awful")
awful.rules = require("awful.rules")
beautiful   = require("beautiful")
naughty     = require("naughty")

-- Simple function to load additional LUA files.
function loadrc(name, mod)
  local success
  local result

  -- Which file? In rc/ or in lib/?
  local path = awful.util.getdir("config") .. "/" ..
                (mod and "lib" or "rc") .. "/" .. name .. ".lua"

  -- If the module is already loaded, don't load it again
  if mod and package.loaded[mod] then return package.loaded[mod] end

  -- Execute the RC/module file
  success, result = pcall(function() return dofile(path) end)
  if not success then
    naughty.notify({
      preset = naughty.config.presets.critical,
      title  = "Error while loading an RC file",
      text   = "When loading `" .. name .. "`, got the following error:\n" .. result
    })

    return print("E: error loading RC file '" .. name .. "': " .. result)
  end

  -- Is it a module?
  if mod then
    return package.loaded[mod]
  end

  return result
end

-- Error handling
loadrc("errors")

-- Global configuration
modkey = "Mod4"

config = {}
config.keys        = {}
config.keys.global = {}
config.buttons     = {}
config.terminal    = "urxvt"
config.term_cmd    = config.terminal .. " -e "
config.editor      = os.getenv("EDITOR") or "vim"
config.browser     = os.getenv("BROWSER") or "chromium"
config.layouts     = {
  awful.layout.suit.tile,        -- 1
  awful.layout.suit.tile.bottom, -- 2
  awful.layout.suit.fair,        -- 3
  awful.layout.suit.max,         -- 4
  awful.layout.suit.magnifier,   -- 5
  awful.layout.suit.floating     -- 6
}


loadrc("appearance")
loadrc("wibar")
loadrc("tags")
loadrc("bindings")
loadrc("rules")
loadrc("signals")

