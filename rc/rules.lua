awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      keys = config.keys.client,
      buttons = config.mouse.client
    }
  },
  {
    rule = { class = "URxvt" },
    properties = {
      tag = tags[screen.count()][1]
    }
  },
  {
    rule_any = { class = { "Chromium", "Firefox" } },
    properties = {
      tag = tags[screen.count()][2]
    }
  },
  {
    rule = { class = "Vlc" },
    properties = {
      floating = true,
      tag = tags[screen.count()][3]
    }
  }
}
