---@diagnostic disable: missing-return

--- Sets the clipping rectangle in pixels. all drawing operations will be clipped to the rectangle at x, y with a width and height of w,h. Call clip() to reset.
--- @param x number x coordinate of the clipping rectangle
--- @param y number y coordinate of the clipping rectangle
--- @param w number width of the clipping rectangle
--- @param h number height of the clipping rectangle
--- @param clip_previous ?boolean when clip_previous is true, clip the new clipping region by the old one.
--- @overload fun():void
--- @overload fun(x:number, y:number, w:number, h:number):void
function clip(x, y, w, h, clip_previous) end

--- Sets the pixel at x, y to colour index col (0..63). 
--- When color is not specified, the current draw colour is used.
---
--- for y=0,127 do
---
---   for x=0,127 do
---
---     pset(x, y, x*y/8)
---
---   end
---
-- end
---
--- @param x number x coordinate of the pixel
--- @param y number y coordinate of the pixel
--- @param color? number colour index of the pixel-(0..63)
--- @overload fun(x:number, y:number):void
function pset(x, y, color) end

--- Returns the colour of a pixel on the screen at (x, y).
--- When x and y are out of bounds, pget returns 0.
---
--- while (true) do
---
---   x, y = rnd(128), rnd(128)
---
---   dx, dy = rnd(4)-2, rnd(4)-2
---
---   pset(x, y, pget(dx+x, dy+y))
---
--- end
---
--- @param x number x coordinate of the pixel
--- @param y number y coordinate of the pixel
--- @return number @color index of the pixel-(0..63)
function pget(x, y) end

--- Get the value (val) of sprite n's flag f.
---
--- fset(2, 1 | 2 | 8)   -- sets bits 0,1 and 3
---
--- fset(2, 4, true)     -- sets bit 4
---
--- print(fget(2))       -- 27 (1 | 2 | 8 | 16)
---
--- @param n number sprite index
--- @param f? number flag index 0..7
--- @return boolean @flag value
--- @overload fun(n:number):boolean
function fget(n, f) end

--- Set the value (val) of sprite n's flag f.
--- @param n number sprite index
--- @param f? number flag index 0..7
--- @param val boolean flag value
--- @overload fun(n:number, val:boolean):void
function fset(n, f, val) end

--- Print a string str and optionally set the draw colour to col.
---
--- shortcut: written on a single line, ? can be used to call print without brackets: ?"hi"
---
--- when x, y are not specified, a newline is automatically appended. this can be omitted by ending the string with an explicit termination control character: ?"the quick brown fox\0"
---
--- print returns the right-most x position and lowest y position that occurred while printing, relative to the camera position. This can be used to find out the width of some text by printing it off-screen:
---
--- str = "text to center"
---
--- text_width = print(str, 0, -1000)
---
--- print(str, 100 - text_width/2, 50) -- centered at 100
---
--- @param str string string to print
--- @param x? number x coordinate of the string
--- @param y? number y coordinate of the string
--- @param color? number colour index of the string-(0..63)
--- @return number @right-most x position relative to the camera position.
--- @overload fun(str:string):number
--- @overload fun(str:string, color:number):number
--- @overload fun(str:string, x:number, y:number):number
--- @overload fun(str:string, x:number, y:number, color:number):number
function print(str, x, y, color) end

--- set the cursor position.
--- if col is specified, also set the current colour.
--- @param x number x coordinate of the cursor
--- @param y number y coordinate of the cursor
--- @param color? number colour index of the cursor-(0..63)
--- @overload fun(x:number, y:number):void
function cursor(x, y, color) end

--- set the current colour to be used by shape drawing functions (pset, circ, rect..), when one is not given as the last argument.
--- if color is not specified, the current colour is set to 6.
--- @param color? number colour index of the cursor-(0..63)
function color(color) end

--- clear the screen and reset the clipping rectangle.
--- color defaults to 0 (black)
--- @param color? number colour index of the screen-(0..63)
function cls(color) end

--- set a screen offset of -x, -y for all drawing operations.call camera() to reset
--- @param x? number x coordinate of the camera
--- @param y? number y coordinate of the camera
--- @overload fun():void
function camera(x, y) end

--- draw a circle circle at x,y with radius r
---
--- if r is negative, the circle is not drawn.
---
--- When bit 0x800000000 in color is set, circfill draws inverted (everything outside the circle is drawn).
--- @param x? number | Userdata x coordinate of the circle
--- @param y? number y coordinate of the circle
--- @param r? number radius of the circle
--- @param color? number colour index of the circle-(0..63)
--- @overload fun(x:Userdata):void
--- @overload fun(x:number, y:number, r:number, color:number):void
--- @overload fun(x:number, y:number, r:number):void
function circ(x, y, r, color) end

--- draw a filled circle at x,y with radius r
---
--- if r is negative, the circle is not drawn.
---
--- When bit 0x800000000 in color is set, circfill draws inverted (everything outside the circle is drawn).
--- @param x? number | Userdata x coordinate of the circle
--- @param y? number y coordinate of the circle
--- @param r? number radius of the circle
--- @param color? number colour index of the circle-(0..63)
--- @overload fun(x:Userdata):void
--- @overload fun(x:number, y:number, r:number):void
function circfill(x, y, r, color) end

--- draw an oval that is symmetrical in x and y (an ellipse), with the given bounding rectangle.
--- @param x0 number x coordinate of the top left corner of the bounding rectangle
--- @param y0 number y coordinate of the top left corner of the bounding rectangle
--- @param x1 number x coordinate of the bottom right corner of the bounding rectangle
--- @param y1 number y coordinate of the bottom right corner of the bounding rectangle
--- @param color? number colour index of the oval-(0..63)
--- @overload fun(x0:number, y0:number, x1:number, y1:number):void
function oval(x0, y0, x1, y1, color) end

--- draw an oval that is symmetrical in x and y (an ellipse), with the given bounding rectangle.
---
--- When bit 0x800000000 in color is set, ovalfill is drawn inverted.
--- @param x0 number x coordinate of the top left corner of the bounding rectangle
--- @param y0 number y coordinate of the top left corner of the bounding rectangle
--- @param x1 number x coordinate of the bottom right corner of the bounding rectangle
--- @param y1 number y coordinate of the bottom right corner of the bounding rectangle
--- @param color? number colour index of the oval-(0..63)
--- @overload fun(x0:number, y0:number, x1:number, y1:number):void
function ovalfill(x0, y0, x1, y1, color) end

--- draw a line from (x0, y0) to (x1, y1)
---
--- if (x1, y1) are not given, the end of the last drawn line is used.
---
--- line() with no parameters means that the next call to line(x1, y1) will only set the end points without drawing.
---
--- function _draw()
---
---   cls()
---
---   line()
---
---   for i=0,6 do
---
---     line(64+cos(t()+i/6)*20, 64+sin(t()+i/6)*20, 8+i)
---
---   end
---
--- end
---
--- @param x0 number x coordinate of the start point
--- @param y0 number y coordinate of the start point
--- @param x1? number x coordinate of the end point
--- @param y1? number y coordinate of the end point
--- @param color? number colour index of the line-(0..63)
--- @overload fun(x0:number, y0:number, x1:number, y1:number):void
--- @overload fun(x0:number, y0:number):void
function line(x0, y0, x1, y1, color) end

--- draw a rectangle rectangle with corners at (x0, y0), (x1, y1).

--- @param x0 number x coordinate of the top left corner of the rectangle
--- @param y0 number y coordinate of the top left corner of the rectangle
--- @param x1 number x coordinate of the bottom right corner of the rectangle
--- @param y1 number y coordinate of the bottom right corner of the rectangle
--- @param color? number colour index of the rectangle-(0..63)
function rect(x0, y0, x1, y1, color) end

--- draw a filled rectangle with corners at (x0, y0), (x1, y1).
---
--- When bit 0x800000000 in col is set, rectfill draws inverted.
--- @param x0 number x coordinate of the top left corner of the rectangle
--- @param y0 number y coordinate of the top left corner of the rectangle
--- @param x1 number x coordinate of the bottom right corner of the rectangle
--- @param y1 number y coordinate of the bottom right corner of the rectangle
--- @param color? number colour index of the rectangle-(0..63)
function rectfill(x0, y0, x1, y1, color) end

--- draw a rectangle with rounded corners.
---
--- Width and height are in pixels, and must both be more than 0 for the shape to be drawn.
---
--- Radius defaults 0, and is the size of the quarter-circle to be drawn at each corner. The radius used is clamped to fall the range 0 .. min(width,height)/2.
--- @param x number x coordinate of the top left corner of the rectangle
--- @param y number y coordinate of the top left corner of the rectangle
--- @param width number width of the rectangle
--- @param height number height of the rectangle
--- @param radius number radius of the corners
--- @param color? number colour index of the rectangle-(0..63)
--- @overload fun(x:number, y:number, width:number, height:number, radius:number):void
function rrect(x, y, width, height, radius, color) end

--- draw a filled rectangle with rounded corners.
---
--- Width and height are in pixels, and must both be more than 0 for the shape to be drawn.
---
--- Radius defaults 0, and is the size of the quarter-circle to be drawn at each corner. The radius used is clamped to fall the range 0 .. min(width,height)/2.
---
--- When bit 0x800000000 in col is set, rrectfill draws inverted.
---
--- Draw a red (colour 8) rounded rectangle 40 pixels wide and 30 pixels talls with 3 pixels missing at each corner (radius 2):
---
--- rrectfill(100,50,40,30,2,8)
--- @param x number x coordinate of the top left corner of the rectangle
--- @param y number y coordinate of the top left corner of the rectangle
--- @param width number width of the rectangle
--- @param height number height of the rectangle
--- @param radius number radius of the corners
--- @param color? number colour index of the rectangle-(0..63)
--- @overload fun(x:number, y:number, width:number, height:number, radius:number):void
function rrectfill(x, y, width, height, radius, color) end

--- swaps colour c0 for c1 for one of three palette re-mappings
---
--- To reset a palette to the default, use pal(which) -- e.g. pal(0) to reset the draw palette.
---
--- pal() resets the draw palette and display palette, but not the rgb display palette.
--- @param c0? number colour index to swap from
--- @param c1? number colour index to swap to
--- @param p? number palette index to swap (0, 1 or 2), defaults to 0
---
--- 0: Draw palette
---
--- The draw palette re-maps colours when they are drawn. For example, an orange flower sprite can be drawn as a red flower by setting the 9th palette value to 8:
---
--- pal(9,8)     -- draw subsequent orange (colour 9) pixels as red (colour 8)
---
--- spr(1,70,60) -- any orange pixels in the sprite will be drawn with red instead
---
--- 1: Indexed display palette
---
--- The display palette re-maps the whole screen when it is displayed at the end of a frame.
---
--- 2: RGB display palette
---
--- The raw red, green, blue values that are finally displayed for a given colour index.
---
--- pal(1, 0xff0080, 2)
---
--- @overload fun():void
--- @overload fun(c0:number):void
--- @overload fun(c0:number, c1:number):void
function pal(c0, c1, p) end

--- Set transparency for colour index c to is_transparent (boolean) transparency is observed by spr(), sspr(), map() and tline3d()
--- palt() resets to default: all colours opaque except colour 0. Same as palt(1)
---
--- palt(8, true) -- red pixels not drawn in subsequent sprite/tline draw calls
---
--- When c is the only parameter, it is treated as a bitfield used to set all 64 values. for example: to set colours 0 and 1 as transparent:
---
--- palt(0x13) -- set colours 0,1 and 4 as transparent
--- @param c? number colour index to set transparency for
--- @param is_transparent? boolean transparency state
--- @overload fun():void
--- @overload fun(c:number):void
function palt(c, is_transparent) end

--- Draw sprite s at position x,y.
--- 
--- s can be either a userdata (type "u8" -- see Userdata) or sprite index (see Sprite Indexes).
---
--- Colour 0 drawn as transparent by default (see palt())
--- @param s number sprite index or userdata
--- @param x number x coordinate of the sprite
--- @param y number y coordinate of the sprite
--- @param flip_x? boolean flip sprite horizontally
--- @param flip_y? boolean flip sprite vertically
--- @overload fun(s:number, x:number, y:number):void
--- @overload fun(s:number, x:number, y:number, flip_x:boolean):void
function spr(s, x, y, flip_x, flip_y) end

--- Stretch a source rectangle of sprite s (sx, sy, sw, sh) to a destination rectangle on the screen (dx, dy, dw, dh). 
--- In both cases, the x and y values are coordinates (in pixels) of the rectangle's top left corner, with a width of w, h.
--- @param s number s can be either a userdata (type "u8") or a sprite index.
--- @param sx number source x coordinate
--- @param sy number source y coordinate
--- @param sw number source width
--- @param sh number source height
--- @param dx number destination x coordinate
--- @param dy number destination y coordinate
--- @param dw? number destination width, dw defaults to sw.
--- @param dh? number destination height, dh defaults to sh.
--- @param flip_x? boolean flip sprite horizontally
--- @param flip_y? boolean flip sprite vertically
--- @overload fun(s:number, sx:number, sy:number, sw:number, sh:number, dx:number, dy:number):void
--- @overload fun(s:number, sx:number, sy:number, sw:number, sh:number, dx:number, dy:number, dw:number, dh:number):void
--- @overload fun(s:number, sx:number, sy:number, sw:number, sh:number, dx:number, dy:number, dw:number, dh:number, flip_x:boolean):void
function sspr(s, sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y) end

--- Get the sprite for a given index (0..8191).
--- @param index number sprite index
--- @return userdata @a 2d userdata object of type "u8"
function get_spr(index) end

--- Set the sprite for a given index (0..8191).
--- @param index number sprite index
--- @param ud userdata @a 2d userdata object of type "u8"
function set_spr(index, ud) end

--- @param ... number
--- Set a 4x4 fill pattern using PICO-8 style fill patterns. p is a bitfield in reading order starting from the highest bit.
---
--- Observed by circ() circfill() rect() rectfill() oval() ovalfill() pset() line()
---
--- Fill patterns in Picotron are 64-bit specified 8 bytes from 0x5500, where each byte is a row (top to bottom) and the low bit is on the left. 
--- To define an 8x8 with high bits on the right (so that binary numbers visually match), fillp can be called with 8 arguments:
---
--- fillp(
---   0b10000000,
---   0b01011110,
---   0b00101110,
---   0b00010110,
---   0b00001010,
---   0b00000100,
---   0b00000010,
---   0b00000001
--- )
function fillp(...) end