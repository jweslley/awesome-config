local layouts = config.layouts

tags = {
  names   = { "term"     , "web"      , "media"    , "misc"     , "freeze"   },
  layouts = { layouts[2] , layouts[4] , layouts[4] , layouts[1] , layouts[4] }
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layouts)
  for i, t in ipairs(tags[s]) do
    awful.tag.setproperty(t, "mhfact", i==1 and 0.6 or 0.5)
    awful.tag.setproperty(t, "hide",   i==5)
  end
end

config.keys.global = awful.util.table.join(config.keys.global,
  awful.key({ modkey, }, "Left",   awful.tag.viewprev,        {description="view previous", group="tag"}),
  awful.key({ modkey, }, "Right",  awful.tag.viewnext,        {description="view next",     group="tag"}),
  awful.key({ modkey, }, "Escape", awful.tag.history.restore, {description="go back",       group="tag"})
)

-- Bind all key numbers to tags.
for i = 1, 5 do
  config.keys.global = awful.util.table.join(config.keys.global,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description="view tag #"..i, group="tag"}
    ),

    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description="toggle tag #" .. i, group="tag"}
    ),

    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description="move focused client to tag #"..i, group="tag"}
    ),

    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      {description="toggle focused client on tag #" .. i, group="tag"}
    )
  )
end
