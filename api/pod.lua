---@diagnostic disable: missing-return

--[[
A POD ("Picotron Object Data") is a string that encodes Lua values: tables, Userdata, strings, numbers booleans, and nested tables containing those types.

PODs form the basis of all data transfer and storage in Picotron. Every file is a single POD on disk, the contents of the clipboard is a POD, images embedded in documents are PODs, and messages sent between processes are PODs.
]]

--- Returns a binary string encoding val. When a table contains circular references, pod() returns nil. Functions and other non-encodable values can be present in this input, but are encoded with a value of nil.
--- @param val any The value to encode.
--- @param flags? number flags determine the encoding format. The default flags value is 0x0 which gives plain text that is also legal Lua that returns the value being encoded
--- @param metadata? table metadata is an optional table that is encoded into the string and stores additional information about the pod. When the second or third parameter is a table, it is taken to be the metadata
--- @return string @The encoded value
function pod(val, flags, metadata) end

--- returns the decoded value, and the decoded metadata as a second result
--- @param str string The string to decode
--- @return string @The decoded value
--- @return table @The decoded metadata table
function unpod(str) end