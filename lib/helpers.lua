local screen = screen
local client = client
local config = config
local awful  = require("awful")

module("jweslley/helpers")


-- Focus helpers

function next_client()
  awful.client.focus.byidx(1)
  if client.focus then
    client.focus:raise()
  end
end

function prev_client()
  awful.client.focus.byidx(-1)
  if client.focus then
    client.focus:raise()
  end
end

function last_client()
  awful.client.focus.history.previous()
  if client.focus then
    client.focus:raise()
  end
end

function next_screen()
  awful.screen.focus_relative(1)
end

function prev_screen()
  awful.screen.focus_relative(-1)
end


-- Layout manipulation helpers

function incmw() awful.tag.incmwfact( 0.05) end
function decmw() awful.tag.incmwfact(-0.05) end

function incnm() awful.tag.incnmaster( 1) end
function decnm() awful.tag.incnmaster(-1) end

function incncol() awful.tag.incncol( 1) end
function decncol() awful.tag.incncol(-1) end

function next_layout() awful.layout.inc(config.layouts,  1) end
function prev_layout() awful.layout.inc(config.layouts, -1) end

function swap_next() awful.client.swap.byidx( 1) end
function swap_prev() awful.client.swap.byidx(-1) end


-- Client helpers

function close_window(c) c:kill()  end
function raise_window(c) c:raise() end
function stick_window(c) c.sticky = not c.sticky end
function fullscreen(c)   c.fullscreen = not c.fullscreen end

function switch_with_master(c)
  c:swap(awful.client.getmaster())
end

function movetoscreen(c)
  if screen.count() == 1 then return nil end
  local s = awful.util.cycle(screen.count(), c.screen + 1)
  if awful.tag.selected(s) then
    c.screen = s
    client.focus = c
    c:raise()
  end
end

function maximize(c)
  c.maximized_horizontal = not c.maximized_horizontal
  c.maximized_vertical   = not c.maximized_vertical
  c:raise()
end

function toggle_window(c)
  if c == client.focus then
    c.minimized = true
  else
    -- Without this, the following
    -- :isvisible() makes no sense
    c.minimized = false
    if not c:isvisible() then
      awful.tag.viewonly(c:tags()[1])
    end
    -- This will also un-minimize
    -- the client, if needed
    client.focus = c
    c:raise()
  end
end
