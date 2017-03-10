awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      keys = config.keys.client,
      buttons = config.buttons.client,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },
  {
    rule = { class = "URxvt" },
    properties = { tag = "term" }
  },
  {
    rule_any = { class = { "Chromium", "Firefox" } },
    properties = { tag = "web" }
  },
  {
    rule_any = { role = { "pop-up" } },
    properties = { tag = "web", floating = true }
  },
  {
    rule = { class = "Vlc" },
    properties = { tag = "media" }
  }
}
