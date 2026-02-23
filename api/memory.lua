---@diagnostic disable: missing-return

--[[
Each process in Picotron has a limit of 32MB RAM, which includes both allocations for Lua objects, and data stored directly in RAM using memory functions like poke() and memcpy(). In the latter case, 4k pages are allocated when a page is written, and can not be deallocated during the process lifetime.

Only 16MB of ram is addressable: 0x000000..0xffffff. Memory addresses below 0x80000 and above 0xf00000 are mostly reserved for system use, but anything in the 0x80000..0xefffff range can be safely used for arbitrary purposes.
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
--- @param ...? number additional bytes to write
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