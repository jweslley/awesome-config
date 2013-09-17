-- Lookup function for icons

local paths = {
  "/usr/share/icons/Faenza-Dark",
  "/usr/share/icons/Faenza",
  "/usr/share/icons/hicolor",
  "/usr/share/icons/HighContrast",
}
local sizes = {
  '48',
  '32',
  '24',
  '22',
  '16',
}
local types = {
  'apps',
  'actions',
  'devices',
  'status',
}
local formats = {
  ".png",
  ".xpm"
}

local assert = assert
local type   = type
local pairs  = pairs
local awful  = require("awful")

module("jweslley/icons")

-- Lookup for an icon. Return full path.
function lookup(arg)
   local inames = assert(arg.name)
   local isizes = arg.size or sizes
   local itypes = arg.type or types
   local ipaths = paths
   local iformats = formats
   if type(isizes) ~= "table" then isizes = { isizes } end
   if type(itypes) ~= "table" then itypes = { itypes } end
   if type(inames) ~= "table" then inames = { inames } end

   for _, path in pairs(ipaths) do
     for _, size in pairs(isizes) do
       for _, t in pairs(itypes) do
         for _, name in pairs(inames) do
           if name then
             for _, name in pairs({name, name:lower()}) do
               for _, ext in pairs(iformats) do
                 local icon = path .. "/" .. t .. "/" .. size .. "/" .. name .. ext
                 if awful.util.file_readable(icon) then
                   return icon
                 end
               end
             end
           end
         end
       end
     end
   end
end
