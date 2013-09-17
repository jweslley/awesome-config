-- Handle volume (through pulseaudio)

local awful    = require("awful")
local naughty  = require("naughty")
local tonumber = tonumber
local string   = string
local config   = config
local icons    = loadrc("icons", "jweslley/icons")
local wibox    = require("wibox")

module("jweslley/volume")

local lastid  = nil
local channel = "Master"
local _widget = wibox.widget.imagebox()

local function amixer(args)
  local out = awful.util.pread("amixer " .. args)
  local vol, mute = out:match("([%d]+)%%.*%[([%l]*)")
  if not mute or not vol then return end

  vol = tonumber(vol)
  local icon = "high"
  if mute ~= "on" or vol == 0 then
    icon = "muted"
  elseif vol < 30 then
    icon = "low"
  elseif vol < 60 then
    icon = "medium"
  end

  local icon = icons.lookup({name = "audio-volume-" .. icon, type = "status"})
  _widget:set_image(icon)
  lastid = naughty.notify({ text = string.format("%3d %%", vol),
        icon = icon,
        font = "Ubuntu Bold 24",
        replaces_id = lastid }).id
end

function increase()
  amixer("sset " .. channel .. " 5%+")
end

function decrease()
  amixer("sset " .. channel .. " 5%-")
end

function toggle()
  amixer("sset " .. channel .. " toggle")
end

function update()
  amixer("sget " .. channel)
end

function mixer()
  awful.util.spawn(config.term_cmd .. "alsamixer", false)
end

function widget()
  _widget:buttons(awful.util.table.join(
    awful.button({ }, 3, mixer),
    awful.button({ }, 1, toggle),
    awful.button({ }, 4, increase),
    awful.button({ }, 5, decrease)
  ))
  update()
  return _widget
end
