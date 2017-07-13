theme = {}

theme.font          = "Ubuntu 10"
theme.icons         = awful.util.getdir("config") .. "/icons"
--theme.wallpaper     = "/home/jweslley/.wallpaper.png"

theme.bg_normal     = "#1A1A1A"
theme.bg_focus      = "#313131"
theme.bg_urgent     = "#1A1A1A"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#666666"
theme.fg_focus      = "#cccccc"
theme.fg_urgent     = "#ff5733"

theme.border_width  = 1
theme.border_normal = theme.bg_normal
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.tasklist_bg_focus = theme.bg_normal

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
