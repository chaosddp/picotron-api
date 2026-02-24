---@diagnostic disable: missing-return

--[[
Each process in Picotron has a limit of 32MB RAM, which includes both allocations for Lua objects, and data stored directly in RAM using memory functions like poke() and memcpy(). In the latter case, 4k pages are allocated when a page is written, and can not be deallocated during the process lifetime.

Only 16MB of ram is addressable: 0x000000..0xffffff. Memory addresses below 0x80000 and above 0xf00000 are mostly reserved for system use, but anything in the 0x80000..0xefffff range can be safely used for arbitrary purposes.
]]

--[[

Picotron has 16MB of addressable RAM (0x000000 ~ 0xffffff), that can be manipulated using standard Memory functions ( poke, memset etc). 
Most of the values at the following special addresses can be manipulated using API functions (e.g. pal() writes values to the colour tables), 
but they can also be manipulated directly in memory for greater control.

▨ Memory Layout

0x000000 ~ 0x003fff    Legacy PICO-8 range
0x004000 ~ 0x0047ff    Primary P8SCII Font (2k)
0x005000 ~ 0x0053ff    ARGB display palettes (1k)
0x005400 ~ 0x005477    Per-scanline rgb display palette selection (120 bytes)
0x005480 ~ 0x0054bf    Indexed display palette (64 bytes)
0x0054c0 ~ 0x00553f    Misc draw state (128 bytes)
0x005580 ~ 0x0055ff    Raw controller state (128 bytes)
0x005600 ~ 0x005dff    Secondary P8SCII font (2k)
0X005e00 ~ 0x005eff    Reserved: P8 persistent state (256 bytes)
0x005f00 ~ 0x005f7f    P8 draw State (some used by Picotron)
0x005f80 ~ 0x007fff    Reserved: legacy P8 gpio, video memory
0x008000 ~ 0x00bfff    Colour tables (16k)
0x00c000 ~ 0x00ffff    Reserved (16k)
0x010000 ~ 0x02ffff    Display / Draw Target (128k)
0x030000 ~ 0x07ffff    Default audio data range
0x100000 ~ 0x1fffff    Default map
0x200000 ~ 0xefffff    Unreserved
0xf00000 ~ 0xffffff    Wavetable data


▨ Draw State

0x5400  (120) per-scanline rgb display palette selection
0x5478  (4) display w,h
0x547c  (4) video_mode, alpha_bits, interact_bits, video_state_bits
0x5480  (64) indexed display palette
0x54c0  (48) reserved
0x54f0  (12) cur_x, cur_y, cur_x_home
0x54fc  (4) reserved
 
0x5500  (8) fill pattern
0x5508  read mask
0x5509  write mask
0x550a  target mask (sprites)
0x550b  target mask (shapes)
 
0x550c  (2) col0, col1 (draw colours)
0x550e  (2) map tile_w, tile_h in pixels
0x5510  (8) cam_x, cam_y
0x5518  (7) reserved
0x551f  (1) line_set_x1y1_mode   // set by line()
0x5520  (8) line_x, line_y
0x5528  (8) clip_x0, y0, x1, y1
0x5530  (4) tline3d_offset_x, y  
0x5534  (4) tline3d_loop_w, h  // val-1 is used as a mask, so when %0x5534 == 0, x mask is 0xffff


▨ Audio State

0x5538 app sfx_vol      //  0x80 means 1.0
0x5539 app music_vol    //  0x80 means 1.0
0x553a sfx vol          //  chan->mix_vol for next play
0x553b unused
0x553c sfx base_addr    //  for next play. 0x3 means 0x30000
0x553d music base_addr  //  for next play. can also set with @music()
0x553e unused(2)


]]


--- read a byte from an address in ram
--- @param addr number address in ram
--- @param n? number if n is specified, peek() returns that number of results (max: 65536)
--- @return number | number[] @byte or bytes
function peek(addr, n) end

--- write one or more bytes to an address in base ram. if more than one parameter is provided, they are written sequentially (max: 65536).
--- @param addr number address in ram
--- @param val1 number first byte to write
--- @param val2? number second byte to write
--- @param ... number additional bytes to write
function poke(addr, val1, val2, ...) end

--- i16 version of peek
--- @param addr number address in ram
--- @return number
function peek2(addr) end

--- i16 version of poke
--- @param addr number address in ram
--- @param val number byte to write
function poke2(addr, val) end

--- i32 version of peek
--- @param addr number address in ram
--- @return number
function peek4(addr) end

--- i32 version of poke
--- @param addr number address in ram
--- @param val number byte to write
function poke4(addr, val) end

--- i64 version of peek
--- @param addr number address in ram
--- @return number
function peek8(addr) end

--- i64 version of poke
--- @param addr number address in ram
--- @param val number byte to write
function poke8(addr, val) end

--- copy len bytes of base ram from source to dest. sections can be overlapping (but is slower)
--- @param dest_addr number destination address in ram
--- @param source_addr number source address in ram
--- @param len number number of bytes to copy
function memcpy(dest_addr, source_addr, len) end

--- write the 8-bit value val into memory starting at dest_addr, for len bytes.
---
--- for example, to fill half of video memory with 0xc8: memset(0x10000, 0xc8, 0x10000)
--- @param dest_addr number destination address in ram
--- @param val number value to write
--- @param len number number of bytes to write
function memset(dest_addr, val, len) end