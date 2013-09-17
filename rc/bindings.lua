local brightness = loadrc("brightness", "jweslley/brightness")
local volume     = loadrc("volume", "jweslley/volume")
local keydoc     = loadrc("keydoc", "jweslley/keydoc")
local tools      = loadrc("tools", "jweslley/tools")
local helpers    = loadrc("helpers", "jweslley/helpers")

config.keys.global = awful.util.table.join(

  keydoc.group("Focus"),

  awful.key({ modkey , }           , "j"   , helpers.next_client        , "Focus next window")               ,
  awful.key({ modkey , }           , "k"   , helpers.prev_client        , "Focus previous window")           ,
  awful.key({ modkey , }           , "Tab" , helpers.last_client        , "Focus previously focused window") ,
  awful.key({ modkey , }           , "u"   , awful.client.urgent.jumpto , "Jump to urgent client")           ,
  awful.key({ modkey , "Control" } , "j"   , helpers.next_screen        , "Jump to next screen")             ,
  awful.key({ modkey , "Control" } , "k"   , helpers.prev_screen        , "Jump to previous screen")         ,


  keydoc.group("Layout manipulation"),

  awful.key({ modkey , }           , "l"     , helpers.incmw       , "Increase master-width factor") ,
  awful.key({ modkey , }           , "h"     , helpers.decmw       , "Decrease master-width factor") ,
  awful.key({ modkey , "Shift"   } , "h"     , helpers.incnm       , "Increase number of masters")   ,
  awful.key({ modkey , "Shift"   } , "l"     , helpers.decnm       , "Decrease number of masters")   ,
  awful.key({ modkey , "Control" } , "h"     , helpers.incncol     , "Increase number of columns")   ,
  awful.key({ modkey , "Control" } , "l"     , helpers.decncol     , "Decrease number of columns")   ,
  awful.key({ modkey , }           , "space" , helpers.next_layout , "Next layout")                  ,
  awful.key({ modkey , "Shift"   } , "space" , helpers.prev_layout , "Previous layout")              ,
  awful.key({ modkey , "Shift"   } , "j"     , helpers.swap_next   , "Swap with next window")        ,
  awful.key({ modkey , "Shift"   } , "k"     , helpers.swap_prev   , "Swap with previous window")    ,


  keydoc.group("Misc"),

  awful.key({                   }, "Print", tools.screenshot),
  awful.key({ modkey, "Control" }, "l", tools.lock_screen),
  awful.key({ modkey,           }, "Return", tools.terminal, "Spawn a terminal"),

  -- Awesome
  awful.key({ modkey , "Control" } , "r" , awesome.restart , "Restart Awesome") ,
  awful.key({ modkey , "Shift"   } , "q" , awesome.quit    , "Quit Awesome")    ,

  -- Multimedia keys
  awful.key({ } , "XF86MonBrightnessUp"   , brightness.increase) ,
  awful.key({ } , "XF86MonBrightnessDown" , brightness.decrease) ,
  awful.key({ } , "XF86AudioRaiseVolume"  , volume.increase)     ,
  awful.key({ } , "XF86AudioLowerVolume"  , volume.decrease)     ,
  awful.key({ } , "XF86AudioMute"         , volume.toggle)       ,

  -- Help
  awful.key({ modkey, }, "F1", keydoc.display)
)

config.keys.client = awful.util.table.join(
  keydoc.group("Window-specific bindings"),
  awful.key({ modkey , }           , "f"      , helpers.fullscreen           , "Fullscreen")                ,
  awful.key({ modkey , }           , "x"      , helpers.close_window         , "Close")                     ,
  --TODO awful.key({ modkey , }           , "o"      , awful.client.movetoscreen                        ) ,
  awful.key({ modkey , }           , "o"      , helpers.movetoscreen         , "Move to the other screen")  ,
  awful.key({ modkey , "Control" } , "space"  , awful.client.floating.toggle , "Toggle floating")           ,
  awful.key({ modkey , "Control" } , "Return" , helpers.switch_with_master   , "Switch with master window") ,
  awful.key({ modkey , }           , "t"      , helpers.raise_window         , "Raise window")              ,
  awful.key({ modkey , }           , "s"      , helpers.stick_window         , "Stick window")              ,
  awful.key({ modkey , }           , "m"      , helpers.maximize             , "Maximize")
)

keydoc.group("Misc")

config.mouse.client = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize)
)
