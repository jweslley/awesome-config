theme = {}

theme.font          = "Ubuntu 10"
theme.icons         = awful.util.getdir("config") .. "/icons"
--theme.wallpaper     = "/home/jweslley/.wallpaper.png"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#b94a48"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#cccccc"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- Widgets
--theme.bg_widget = "#cc0000"

-- Taglist icons
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

-- Layout icons
for _, l in pairs(config.layouts) do
  theme["layout_" .. l.name] = theme.icons .. "/layouts/" .. l.name .. ".png"
end

return theme
