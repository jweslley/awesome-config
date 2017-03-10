-- Theme
beautiful.init(awful.util.getdir("config") .. "/theme.lua")

-- Naughty
for _,preset in pairs({"normal", "low", "critical"}) do
  naughty.config.presets[preset].font    = "Ubuntu 12"
  naughty.config.presets[preset].timeout = 5
  naughty.config.presets[preset].margin  = 10
end
