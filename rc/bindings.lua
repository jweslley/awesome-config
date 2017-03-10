local tools      = loadrc("tools", "jweslley/tools")
local helpers    = loadrc("helpers", "jweslley/helpers")
local hotkeys_popup = require("awful.hotkeys_popup").widget


-- Mouse bindings

config.buttons.client = awful.util.table.join(
  awful.button({        }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize)
)

config.buttons.global = awful.util.table.join(
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)


-- Key bindings

config.keys.global = awful.util.table.join(config.keys.global,

  -- Client
  awful.key({ modkey, },   "j", helpers.next_client,        {description="focus next window",               group="client"}),
  awful.key({ modkey, },   "k", helpers.prev_client,        {description="focus previous window",           group="client"}),
  awful.key({ modkey, }, "Tab", helpers.last_client,        {description="focus previously focused window", group="client"}),
  awful.key({ modkey, },   "u", awful.client.urgent.jumpto, {description="jump to urgent client",           group="client"}),

  awful.key({ modkey,   "Shift" }, "j", helpers.swap_next,      {description="swap with next window",     group="client"}),
  awful.key({ modkey,   "Shift" }, "k", helpers.swap_prev,      {description="swap with previous window", group="client"}),
  awful.key({ modkey, "Control" }, "n", helpers.restore_client, {description="restore minimized window",  group="client"}),

  -- Screen
  awful.key({ modkey, "Control" }, "j", helpers.next_screen, {description="jump to next screen",     group="screen"}),
  awful.key({ modkey, "Control" }, "k", helpers.prev_screen, {description="jump to previous screen", group="screen"}),

  -- Layout manipulation

  awful.key({ modkey,           }, "l", helpers.incmw,   {description="increase master-width factor", group="layout"}),
  awful.key({ modkey,           }, "h", helpers.decmw,   {description="decrease master-width factor", group="layout"}),
  awful.key({ modkey,   "Shift" }, "h", helpers.incnm,   {description="increase number of masters",   group="layout"}),
  awful.key({ modkey,   "Shift" }, "l", helpers.decnm,   {description="decrease number of masters",   group="layout"}),
  awful.key({ modkey, "Control" }, "h", helpers.incncol, {description="increase number of columns",   group="layout"}),
  awful.key({ modkey, "Control" }, "l", helpers.decncol, {description="decrease number of columns",   group="layout"}),

  awful.key({ modkey,         }, "space", helpers.next_layout, {description="next layout",     group="layout"}),
  awful.key({ modkey, "Shift" }, "space", helpers.prev_layout, {description="previous layout", group="layout"}),

  -- -- Multimedia keys
  -- awful.key({ } , "XF86MonBrightnessUp"   , brightness.increase) ,
  -- awful.key({ } , "XF86MonBrightnessDown" , brightness.decrease) ,
  -- awful.key({ } , "XF86AudioRaiseVolume"  , volume.increase)     ,
  -- awful.key({ } , "XF86AudioLowerVolume"  , volume.decrease)     ,
  -- awful.key({ } , "XF86AudioMute"         , volume.toggle)       ,

  -- Launcher
  awful.key({ modkey, }, "Return", tools.terminal,   {description="open a terminal", group="launcher"}),
  awful.key({ modkey, },      "r", tools.promptbox,  {description="run prompt",      group="launcher"}),
  awful.key({ modkey, },      "w", tools.websearch,  {description="web search",      group="launcher"}),

  -- System
  awful.key({                   },  "Print", tools.screenshot,  {description="screenshot",  group="system"}),
  awful.key({ modkey, "Control" },      "l", tools.lock_screen, {description="lock screen", group="system"}),

  -- Awesome
  awful.key({ modkey,           }, "F1", hotkeys_popup.show_help, {description="show help",      group="awesome"}),
  awful.key({ modkey, "Control" },  "r", awesome.restart,         {description="reload awesome", group="awesome"}),
  awful.key({ modkey, "Shift"   },  "q", awesome.quit,            {description="quit awesome",   group="awesome"})
)

config.keys.client = awful.util.table.join(
  awful.key({ modkey, "Control" },  "space", awful.client.floating.toggle, {description="toggle floating",    group="client"}),
  awful.key({ modkey, "Control" }, "Return", helpers.move_to_master,       {description="move to master",     group="client"}),
  awful.key({ modkey,           },      "f", helpers.fullscreen,           {description="toggle fullscreen",  group="client"}),
  awful.key({ modkey,           },      "x", helpers.close_window,         {description="close",              group="client"}),
  awful.key({ modkey,           },      "o", helpers.move_to_screen,       {description="move to screen",     group="client"}),
  awful.key({ modkey,           },      "t", helpers.toggle_client_top,    {description="toggle keep on top", group="client"}),
  awful.key({ modkey,           },      "n", helpers.minimize,             {description="minimize",           group="client"}),
  awful.key({ modkey,           },      "m", helpers.maximize,             {description="maximize",           group="client"}),
  awful.key({ modkey,           },      "s", helpers.stick_client          {description="stick client",       group="client"})
)

root.keys(config.keys.global)
root.buttons(config.buttons.global)
