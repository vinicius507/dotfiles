local set_wallpaper = require('layout.wallpaper')
local set_layouts = require('layout.layouts')
local set_panel = require('layout.panel')
local set_titlebar = require('layout.titlebar')
local notifications = require('layout.notifications')

tag.connect_signal('request::default_layouts', set_layouts)
screen.connect_signal('request::wallpaper', set_wallpaper)
screen.connect_signal('request::desktop_decoration', set_panel)
client.connect_signal("request::titlebars", set_titlebar)

notifications.init()
