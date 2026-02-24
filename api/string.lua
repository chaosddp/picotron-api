---@diagnostic disable: missing-return


--[[
When printed with print(), some characters have a special meaning that can be used to alter things like the cursor position and text rendering style. 
Control characters in Picotron are CHR(0)..CHR(15) and can be written as an escaped sequence ("\n" for newline etc.)

Some of the control codes below take parameters which are written using a scheme that is a superset of hexadecimal format. 
That is, '0'..'f' also mean 0..15. But characters after 'f' are also accepted: 'g' means 16 and so on. Such parameters are written below as P0, P1.

For example, to print with a blue background ("\#c") and dark gray foreground ("\f5"):

print("\#c\f5 blue ")

The only side-effects on the draw state are changes in cursor position and foreground color; all other attributes are reset each time print() is called.


■ Control Codes

0 "\0"   terminate printing
1 "\*"   repeat next character P0 times. ?"\*3a" --> aaa
2 "\#"   draw solid background with colour P0
3 "\-"   shift cursor horizontally by P0-16 pixels
4 "\|"   shift cursor vertically by P0-16 pixels
5 "\+"   shift cursor by P0-16, P1-16 pixels
6 "\^"   special command (see below)
7 "\a"   audio (see below)
8 "\b"   backspace
9 "\t"   tab
a "\n"   newline
b "\v"   decorate previous character (see below)
c "\f"   set foreground colour
d "\r"   carriage return
e "\014" switch to font defined at 0x5600
f "\015" switch to primary font at 0x4000


These commands all start with "\^" and take up to 2 parameters (P0, P1) For example, to clear screen to dark blue: print("\^c1")

g set cursor position to home h set home to cursor position j jump to absolute P0*4, P1*4 (in screen pixels) r set rhs character wrap boundary to P0*4 s set tab stop width to P0*char_w pixels (used by "\t") u underline x set character width y set character height o draw outline; colour: P0 followed by 2 chars of hexadecimal (see P8SCII_Outlines)

■ Rendering mode options
    prefix these with "-" to disable: e.g. ?"\^i on \^-i off "

w wide mode: scales by 2x1
t tall mode: scales by 1x2
= stripey mode: when wide or tall, draw only even pixels
p pinball mode: wide and tall, drawing only a single pixel in each 2x2 group
i invert
b border: toggle 1px padding on left and top // on by default
# solid background  // off by default, but enabled automatically by \#

■ Raw memory writes
The following two commands take 4-character hex parameters:

@addrnnnn[binstr] poke nnnn bytes to address addr
!addr[binstr]     poke all remaining characters to address addr

For example, to write 4 bytes to video memory halfway down the screen:

>?"\^@70000004xxxxhello"

■ One-off characters
Character data can be specified and printed in-line using \^. followed by 8 bytes of raw binary data, or \^: followed by 8 2-digit hexadecimal values. The data format is the same as custom fonts; each byte specifies a row of 1-bit pixel values, with the low bit on the left.

\^.[8 chars of raw binary data]
\^:[16 chars of hexadecimal]

To print a cat:

> ?"\^:447cb67c3e7f0106"

. and : always render an 8x8 character with no padding. To respect the padding state, use , and ; instead.

> ?"\#3\^;447cb67c3e7f0106"

■ P8SCII Outlines
The outline command first draws each pixel of the character in up to 8 neighbouring positions given by an 8-bit bitfield. The bit value for each neighbour starts with low bits at the top left, and increases in reading order:

0x01    0x02    0x04
0x08     --     0x10
0x20    0x40    0x80

The first character after the command "\^o" is the colour, and the following two characters are the neighbours bitfield in hexadecimal. For example, to draw a pixel up to the left of each foreground pixel, the value 0x01 can be used:

> ?"\^o801hey"

The following draws a blue pixel to the left,right,top and bottom of each foreground pixel which corresponds to bits 8+16+2+64 = 90, or 0x08+0x10+0x02+0x40 = 0x5a in hex:

> ?"\f7\^oc5aoutline"

Finally, a full outline can be achieved by setting all bits. Outline works in combination with the tall and/or wide commands but the outline is still drawn one pixel thick:

> ?"\fe\^w\^t\^o7ffchunky"

Drawing an outline costs around twice as much cpu as drawing a non-outlined character.

The outline colour parameter can be "$" to use the current colour, or "!" to use the current colour and skip drawing the interior.

> ?" \f7\^o!ff empty interior"

ⓘ
The PICO-8 special commands controlling frame flipping (0~9,d) and audio control character \a is not supported in Picotron.

■ Decoration Characters
The control character \v can be used to decorate the last printed character with another character at a given offset, without needing to otherwise manage the cursor position. After the decorating character is printed, the previous cursor position is restored.

The format is \v P0 char, where P0 is a number giving the desired offset, and char is any character to print at that offset (relative to the previous printed character).

The offset has x packed into the lowest 2 bits, and starts (-2,-8) in reading order. So 3 means (+1, -8), 4 means (-2, -7) and so on.

For example, to write "cafÃ©!", using a comma to draw the acute accent:

print"\ncafe\v7,!"

In this case P0 is '7'. So the comma is drawn at:

x = (7%4)-2 = 1
y = (7\4)-8 = -7

■ Fonts
A font in Picotron roughly follows the PICO-8 format: a 2k block of data that encodes 256 8x8 character bitmaps.

The primary font is 2048 bytes of data found at 0x4000, and the secondary font is at 0x5600. The default loaded fonts are /system/fonts/lil.font and /system/fonts/p8.font respectively.

Custom fonts can be be used by directly poking the RAM value (see below), or by loading a 2k block userdata:

> fetch("/system/fonts/lil_mono.font"):poke(0x4000)

Each character is an 8x8 bitfield (1 bit/pixel), where starting from the top, each row is a single byte starting with 0x1 on the left.

The first 128 bytes (characters 0~15 are never drawn) describe attributes of the font:

0x5600 character width in pixels (can be more than 8, but only 8 pixels are drawn)
0x5601 character width for character 128 and above
0x5602 character height in pixels
0x5603 draw offset x
0x5604 draw offset y
0x5605 flags: 0x1 apply_size_adjustments  0x2: apply tabs relative to cursor home
0x5606 tab width in pixels (used only when alt font is drawn)
0x5607 unused

The remaining 120 bytes are used to adjust the width and vertical offset of characters 16..255. Each nibble (low nibbles first) describes the adjustments for one characters:

bits 0x7: adjust character width by 0,1,2,3,-4,-3,-2,-1
bit  0x8: when set, draw the character one pixel higher (useful for latin accents)

■ Default Attributes
Although attributes are reset every time print() is called, it is possible to set their default values by writing to memory addresses 0x5f58..0x5f5b.

0x5f58 // bitfield
  0x1  when set to 0x1, bits 1..7 are observed:
  0x2  padding
  0x4  wide
  0x8  tall
  0x10 solid background
  0x20 invert
  0x40 stripey (when wide or tall)
  0x80 use custom font
 
  e.g. poke(0x5f58, 0x1 | 0x2 | 0x4 | 0x8 | 0x20 | 0x40)  -- pinball everywhere

0x5f59 char_w   (low nibble), char_h   (high)
0x5f5a char_w2  (low nibble), tab_w    (high)
0x5f5b offset_x (low nibble), offset_y (high)
 
    any nibbles equal to 0 are ignored
    tab_w (global tab width) values are in pixels * char_w
]]


--- Convert one or more ordinal character codes to a string.
---
--- chr(64)                    -- "@"
---
--- chr(104,101,108,108,111)   -- "hello"
--- @param val0 number The first character code to convert.
--- @param val1? number The second character code to convert.
--- @param ... number Additional character codes to convert.
--- @return string @The string representation of the given character codes.
function chr(val0, val1, ...) end

--- Convert one or more characters from string STR to their ordinal (0..255) character codes.
---
--- ord("@")         -- 64
---
--- ord("123",2)     -- 50 (the second character: "2")
---
--- ord("123",2,3)   -- 50,51,52
--- @param str string The string to convert.
--- @param index? number Use the index parameter to specify which character in the string to use. When index is out of range or str is not a string, ord returns nil.
--- @param num_results? number When num_results is given, ord returns multiple values starting from index.
function ord(str, index, num_results) end

--- grab a substring from string str, from pos0 up to and including pos1. 
--- when pos1 is not specified, the remainder of the string is returned. 
--- when pos1 is specified, but not a number, a single character at pos0 is returned.
---
--- s = "the quick brown fox"
---
--- print(sub(s,5,9))    --> "quick"
---
--- print(sub(s,5))      --> "quick brown fox"
---
--- print(sub(s,5,true)) --> "q"
--- @param str string The string to grab a substring from.
--- @param pos0 number The starting position of the substring.
--- @param pos1? number The ending position of the substring.
--- @return string @The substring of str.
function sub(str, pos0, pos1) end

--- Split a string into a table of elements delimited by the given separator (defaults to ",")
---
--- split("1,2,3,a,b")               -- {1,2,3,"a","b"}
---
--- split("one:two:3",":",false) -- {"one","two","3"}
---
--- split("1,,2,")               -- {1,"",2,""}
--- @param str string The string to split.
--- @param separator? string When separator is a number n, the string is split into n-character groups.
--- @param convert_numbers? boolean  When convert_numbers is true, numerical tokens are stored as numbers (defaults to true).
--- @return string[] @The table of elements.
function split(str, separator, convert_numbers) end

--- Returns the type of val as a string.
---
--- To find out if a number is an integer or float, use math.type(num).
--- @param val any The value to get the type of.
--- @return string @The type of val.
function type(val) end

--- create_delta returns a string encoding all of the information needed to get from str0 to str1 ("delta").
--- The delta can then be used by apply_delta to reproduce str1 given only str0.
--- @param str0 string The string to encode.
--- @param str1 string The string to encode.
--- @return string @The delta string.
function create_delta(str0, str1) end

--- apply delta to str0
---
--- Note that the string given to apply_delta must be exactly the same as the one used to create the delta; otherwise apply_delta returns nil.
--- This makes deltas useful for things like undo stacks and perhaps (later) changes in game state to send across a network. The binary format of the delta includes a few safety features like crc and length checks to ensure that the input and output strings are as expected. The first 4 bytes of the delta string are always "dst\0".
---
--- str0 = the quick brown fox
---
--- str1 = the quick red fox
---
--- d = create_delta(str0, str1)
---
--- print(apply_delta("the quick brown fox", d)) --> the quick red fox
--- @param str0 string The string to apply the delta to.
--- @param delta string The delta string.
--- @return string @The resulting string.
function apply_delta(str0, delta) end

--- Returns the basename of a path.
--- @param str string The path to get the basename of.
--- @return string @The basename of the path.
function string.basename(str) end

--- Returns the directory name of a path.
--- @param str string The path to get the directory name of.
--- @return string @The directory name of the path.
function string.dirname(str) end