---@diagnostic disable: missing-return


--- Convert one or more ordinal character codes to a string.
---
--- chr(64)                    -- "@"
---
--- chr(104,101,108,108,111)   -- "hello"
--- @param val0 number The first character code to convert.
--- @param val1? number The second character code to convert.
--- @param ...? number Additional character codes to convert.
--- @return string The string representation of the given character codes.
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