local config = config
local awful  = require("awful")

module("jweslley/tools")

function screenshot()
  awful.util.spawn("screenshot", false)
end

function lock_screen()
  awful.util.spawn("xscreensaver-command -lock")
end

function terminal()
  awful.util.spawn(config.terminal)
end
