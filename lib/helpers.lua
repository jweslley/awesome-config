local screen = screen
local client = client
local config = config
local awful  = require("awful")

module("jweslley/helpers")


-- Client helpers

function next_client() awful.client.focus.byidx( 1) end
function prev_client() awful.client.focus.byidx(-1) end

function swap_next() awful.client.swap.byidx( 1) end
function swap_prev() awful.client.swap.byidx(-1) end

function last_client()
  awful.client.focus.history.previous()
  if client.focus then
    client.focus:raise()
  end
end

function restore_client()
  local c = awful.client.restore()
  -- Focus restored client
  if c then
    client.focus = c
    c:raise()
  end
end

function fullscreen(c)
  c.fullscreen = not c.fullscreen
  c:raise()
end

function close_window(c)
  c:kill()
end

function move_to_master(c)
  c:swap(awful.client.getmaster())
end

function move_to_screen(c)
  c:move_to_screen()
end

function toggle_client_top(c)
  c.ontop = not c.ontop
end

function stick_client(c)
  c.sticky = not c.sticky
end

function minimize(c)
  c.minimized = true
end

function maximize(c)
  c.maximized = not c.maximized
  c:raise()
end

-- Screen helpers

function next_screen() awful.screen.focus_relative( 1) end
function prev_screen() awful.screen.focus_relative(-1) end


-- Layout manipulation helpers

function incmw() awful.tag.incmwfact( 0.05) end
function decmw() awful.tag.incmwfact(-0.05) end

function incnm() awful.tag.incnmaster( 1, nil, true) end
function decnm() awful.tag.incnmaster(-1, nil, true) end

function incncol() awful.tag.incncol( 1, nil, true) end
function decncol() awful.tag.incncol(-1, nil, true) end

function next_layout() awful.layout.inc(config.layouts,  1) end
function prev_layout() awful.layout.inc(config.layouts, -1) end
