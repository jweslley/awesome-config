local layouts = config.layouts
local keydoc  = loadrc("keydoc", "jweslley/keydoc")

tags = {
  names  = { "term"     , "web"      , "media"    , "misc"     , 5 }          ,
  layout = { layouts[2] , layouts[4] , layouts[4] , layouts[1] , layouts[3] }
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
  for i, t in ipairs(tags[s]) do
    awful.tag.setproperty(t, "mhfact", i==1 and 0.6 or 0.5)
    awful.tag.setproperty(t, "hide",   i==5)
  end
end

root.buttons(awful.util.table.join(
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

config.keys.global = awful.util.table.join(
  config.keys.global,
  keydoc.group("Tag management"),
  awful.key({ modkey, }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey, }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey, }, "Escape", awful.tag.history.restore, "Switch to previous tag")
)

-- Bind all key numbers to tags.
for i = 1, 5 do
  config.keys.global = awful.util.table.join(config.keys.global,
    keydoc.group("Tag management"),
    awful.key({ modkey }, i,
      function ()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
          awful.tag.viewonly(tag)
        end
      end, i == 1 and "Display only this tag" or nil),

    awful.key({ modkey, "Control" }, i,
      function ()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end, i == 1 and "Toggle display of this tag" or nil),

    awful.key({ modkey, "Shift" }, i,
      function ()
        local tag = awful.tag.gettags(client.focus.screen)[i]
        if client.focus and tag then
          awful.client.movetotag(tag)
        end
      end, i == 1 and "Move window to this tag" or nil),

    awful.key({ modkey, "Control", "Shift" }, i,
      function ()
        local tag = awful.tag.gettags(client.focus.screen)[i]
        if client.focus and tag then
          awful.client.toggletag(tag)
        end
      end, i == 1 and "Toggle this tag on this window" or nil),
    keydoc.group("Misc")
  )
end
