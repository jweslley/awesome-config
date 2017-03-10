local root   = root
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
  awful.spawn(config.terminal)
end

function promptbox()
  awful.screen.focused().mypromptbox:run()
end

function websearch()
  awful.prompt.run {
    prompt       = "Web: ",
    textbox      = awful.screen.focused().mypromptbox.widget,
    history_path = awful.util.get_cache_dir() .. "/history_web",
    exe_callback = function(command)
      awful.util.spawn(config.browser .. " 'https://duckduckgo.com/?q=" .. command .. "'", false)
      awful.tag.viewonly(root.tags()[2])
    end,
  }
end
