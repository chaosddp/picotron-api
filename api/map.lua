---@diagnostic disable: missing-return

--- Draw section of a map (starting from tile_x, tile_y) at screen position sx, sy (pixels), from the userdata src, or from the current working map when src is not given. 
--- Note that the src parameter can be omitted entirely to give a PICO-8 compatible form.
---
--- To draw a 4x2 blocks of tiles starting from 0,0 in the map, to the screen at 20,20: map(0, 0, 20, 20, 4, 2)
---
--- map() is often used in conjunction with camera(). 
--- To draw the map so that a player object (drawn centered at pl.x in pl.y in pixels) is centered in fullscreen (480x270):
---
--- camera(pl.x - 240, pl.y - 135)
--- map()
---
--- @param src? userdata  The map to draw.
--- @param tile_x? number The tile x coordinate to start drawing from. tiles_x and tiles_y default to the entire map.
--- @param tile_y? number The tile y coordinate to start drawing from. tiles_x and tiles_y default to the entire map.
--- @param sx? number The screen x coordinate to start drawing to.
--- @param sy? number The screen y coordinate to start drawing to.
--- @param tiles_x? number The number of tiles to draw in the x direction.
--- @param tiles_y? number The number of tiles to draw in the y direction.
--- @param p8players? number The number of players to draw. p8layers is a bitfield. When given, only sprites with matching sprite flags are drawn. For example, when p8layers is 0x5, only sprites with flag 0 and 2 are drawn. This has nothing to do with the list of layers in the map editor -- it follows PICO-8's approach for getting more than one "layer" out of a single map.
--- @param tile_w? number The width of each tile. tile_w and tile_h specify the integer width and height in pixels that each tile should be drawn. Bitmaps that do not match those dimensions are stretched to fit. The default values for tile_w and tile_h are 0x550e, 0x550f (0 means 256), which are in turn initialised to the dimensions of sprite 0 on run.
--- @param tile_h? number The height of each tile.
--- @overload fun():void
--- @overload fun(tile_x, tile_y):void
--- @overload fun(tile_x, tile_y, sx, sy):void
--- @overload fun(tile_x, tile_y, sx, sy, tiles_x, tiles_y):void
--- @overload fun(tile_x, tile_y, sx, sy, tiles_x, tiles_y, p8players):void
--- @overload fun(tile_x, tile_y, sx, sy, tiles_x, tiles_y, p8players, tile_w, tile_h):void
--- @overload fun(src, tile_x, tile_y):void
--- @overload fun(src, tile_x, tile_y, sx, sy):void
--- @overload fun(src, tile_x, tile_y, sx, sy, tiles_x, tiles_y):void
--- @overload fun(src, tile_x, tile_y, sx, sy, tiles_x, tiles_y, p8players):void
function map(src, tile_x, tile_y, sx, sy, tiles_x, tiles_y, p8players, tile_w, tile_h) end

--- PICO-8 style getters that operate on the current working map. 
--- These are equivalent to using the userdata methods :get and :set directly. 
--- So, if a userdata mymap is the current working map, mget(x,y) is squivalent to mymap:get(x,y).
--- @param x number The x coordinate of the tile to get or set.
--- @param y number The y coordinate of the tile to get or set.
--- @return number The value of the tile at the given coordinates.
function mget(x, y) end

--- PICO-8 style setters that operate on the current working map. 
--- These are equivalent to using the userdata methods :get and :set directly. 
--- So, if a userdata mymap is the current working map, mget(x,y) is squivalent to mymap:get(x,y).
--- @param x number The x coordinate of the tile to get or set.
--- @param y number The y coordinate of the tile to get or set.
--- @param val number The value to set the tile to.
function mset(x, y, val) end

--- Draw a textured line from (x0,y0) to (x1,y1), sampling colour values from either a sprite or a map.
--- @param src? userdata[u8] | userdata[u16] | number number -- sprite index (coordinates in pixels), userdata (u8) -- sprite data, userdata (i16) -- map data (coordinates in tiles)
--- @param x0 number The x coordinate of the start of the line.
--- @param y0 number The y coordinate of the start of the line.
--- @param x1 number The x coordinate of the end of the line.
--- @param y1 number The y coordinate of the end of the line.
--- @param u0 number The u coordinate of the start of the line. u0, v0, u1, v1 are coordinates to sample from, given in pixels for sprites, or tiles for maps.
--- @param v0 number The v coordinate of the start of the line. u0, v0, u1, v1 are coordinates to sample from, given in pixels for sprites, or tiles for maps.
--- @param u1 number The u coordinate of the end of the line. u0, v0, u1, v1 are coordinates to sample from, given in pixels for sprites, or tiles for maps.
--- @param v1 number The v coordinate of the end of the line. u0, v0, u1, v1 are coordinates to sample from, given in pixels for sprites, or tiles for maps.
--- @param w0 number The w coordinate of the start of the line. w0, w1 are used to control perspective and mean 1/z0 and 1/z1. Default values are 1,1 (gives a linear interpolation between uv0 and uv1).
--- @param w1 number The w coordinate of the end of the line. w0, w1 are used to control perspective and mean 1/z0 and 1/z1. Default values are 1,1 (gives a linear interpolation between uv0 and uv1).
--- @param flags? number The flags to use when drawing the line. Experimental flags useful for polygon rendering / rotated sprites: 0x100 to skip drawing the last pixel, 0x200 to perform sub-pixel texture coordinate adjustment.
--- @overload fun(src, x0, y0, x1, y1, u0, v0, u1, v1, w0, w1)
--- @overload fun(x0, y0, x1, y1, u0, v0, u1, v1, w0, w1, flags)
--- @overload fun(x0, y0, x1, y1, u0, v0, u1, v1, w0, w1)
function tline3d(src, x0, y0, x1, y1, u0, v0, u1, v1, w0, w1, flags) end