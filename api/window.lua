---@diagnostic disable: missing-return

--[[
Each process in Picotron has a single window, and a single display that always matches the size of the window. The display is a u8 Userdata that can be manipulated using the regular userdata methods, or using the gfx api while the display is also the draw target.

When a program has a _draw function but a window does not exist by the end of _init(), a fullscreen display and workspace is created automatically. To explicitly create a fullscreen display before then, window() with no parameters can be used.
]]

--- Returns the current display as a u8, 2d Userdata. There is no way to set the display Userdata directly; it can be resized using the window() function.
--- @return Userdata @must be a u8, 2d Userdata
function get_display() end

--- Set the draw target to ud, which must be a u8, 2d Userdata. When ud is not given, set_draw_target() defaults to the current display.
--- @param ud Userdata must be a u8, 2d Userdata
function set_draw_target(ud) end

--- @class WindowAttribs
--- @field width? number       --  width in pixels (not including the frame)
--- @field height? number      --  height in pixels
--- @field title? string       --  set a title displayed on the window's titlebar
--- @field pauseable? boolean   --  false to turn off the @{App Menu} that normally comes up with ENTER
--- @field tabbed? boolean      --  true to open in a tabbed workspace (like the code editor)
--- @field has_frame? boolean   --  default: true
--- @field moveable? boolean    --  default: true
--- @field resizeable? boolean  --  default: true
--- @field wallpaper? boolean   --  act as a wallpaper (z defaults to -1000 in that case)
--- @field autoclose? boolean   --  close window when is no longer in focus or when press escape
--- @field z? number           --  windows with higher z are drawn on top. Defaults to 0
--- @field cursor? number | Userdata      --  0 for no cursor, 1 for default, or a Userdata for a custom cursor
--- @field squashable? boolean  --  window resizes itself to stay within the desktop region
--- @field observe_drag_offset? boolean -- indicates that when items are dropped, their .xo,.yo is used
--- @field background_updates? boolean  -- allow _update() callbacks when parent window is not visible
--- @field background_draws? boolean    -- allow _draw() callbacks when parent window is not visible
local WindowAttribs = {}

--- Create a window and/or set the window's attributes
--- @param attribs? WindowAttribs attributes of the window
--- @param width? number width of window
--- @param height? number height of window
--- @overload fun(width: number, height: number):void
--- @overload fun(attribs: WindowAttribs):void
function window(attribs, width, height) end

--- Set a fullscreen video mode. 
--- @param video_mode number
--- vid(0) -- 480x270
--- vid(1) -- 320x180 -- planned for 0.2.4
--- vid(2) -- 240x180 -- planned for 0.2.4
--- vid(3) -- 240x135
--- vid(4) -- 160x90
function vid(video_mode) end