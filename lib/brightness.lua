-- Handle brightness (with xbacklight)

local awful    = require("awful")
local naughty  = require("naughty")
local tonumber = tonumber
local string   = string
local os       = os
local icons    = loadrc("icons", "jweslley/icons")

module("jweslley/brightness")

local nid = nil
local function change(what)
  -- We don't really change the brightness, just report the change...
  local out = awful.util.pread("xbacklight -get")
  if not out then return end

  out = tonumber(out)
  local icon = icons.lookup({name = "display-brightness", type = "status"})
  nid = naughty.notify({ text = string.format("%3d %%", out),
      icon = icon,
      font = "Ubuntu Bold 24",
      replaces_id = nid }).id
end

function increase()
  change("+ 5")
end

function decrease()
  change("- 5")
end
