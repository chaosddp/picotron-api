---@diagnostic disable: missing-return

--[[
A file in Picotron is a single POD (see the previous section), and uses the metadata part of the POD as a metadata fork. As such, files are stored and fetched atomically; there is no concept of a partial read, write or append.
]]

--- store a Lua object (tables, strings, userdata, booleans and numbers are allowed) as a file.
--- @param filename string The name of the file to store the object in. filenames can contain alphanumeric characters, "_", "-" and "."
--- @param obj any The object to store.
--- @param metadata? table When metadata is given, each field is added to the file's metadata without clobbering any existing fields.
function store(filename, obj, metadata) end

--- Return a Lua object stored in a given file. Returns the object and metadata.
--- @param filename string filename to fetch
--- @param options? table options is a table used for http requests: .on_complete callback when fetching http (means that fetch is not blocking) .method
--- @return any @object stored in the file
--- @return table @metadata stored in the file
function fetch(filename, options) end

--- Store the metadata fork of a file or directory.
--- @param filename string The name of the file or directory to store the metadata in.
--- @param metadata table The metadata to store.
function store_metadata(filename, metadata) end

--- Return the metadata fork of a file or directory.
--- @param filename string The name of the file or directory to fetch the metadata from.
--- @return table @metadata stored in the file
function fetch_metadata(filename) end

--- Create a directory.
--- @param name string The name of the directory to create.
function mkdir(name) end

--- list files and folders in given path relative to the current directory.
--- @param path? string The path to list.
--- @return string[] @list of files and folders in the given path
function ls(path) end

--- Copy a file from src to dest. Folders are copied recursively, and dest is overwritten.
--- @param src string The source file to copy.
--- @param dest string The destination file to copy to.
function cp(src, dest) end

--- Move a file from src to dest. Folders are moved recursively, and dest is overwritten.
--- @param src string The source file to move.
--- @param dest string The destination file to move to.
function mv(src, dest) end

--- Delete a file or folder (recursive).
--- Mount points are also deleted, but the contents of their origin folder are not deleted unless explicitly given as a parameter to rm.
--- @param filename string The file or folder to delete.
function rm(filename) end

--- Return the present working directory. Relative filenames (that do not start with "/") all resolve relative to this path.
--- @return string @the present working directory
function pwd() end

--- Change directory.
--- @param path string The path to change to.
function cd(path) end

--- Resolve a filename to its canonical path based on the present working directory (pwd()).
--- @param filename string The filename to resolve.
--- @return string @the resolved filename
function fullpath(filename) end

--- returns 3 attributes of given filename (if it exists)
--- @param filename string The filename to stat.
--- @return string @file or folder
--- @return number @file size
--- @return string @origin of path
function fstat(filename) end

--- Load and run a Lua file.
---
--- The filename is relative to the present working directory, not the directory that the file was included from.
---
--- Note that include() is quite different from PICO-8's #include, although it is used in a similar way. The difference is that include() is a regular function that is called at runtime, rather than PICO-8's #include which inserts the raw contents of the included file at the preprocessing stage.
---
--- include(filename) is roughly equivalent to: load(fetch(filename))()
--- @param filename string The filename to include.
function include(filename) end

--- A "location" in Picotron is a string that picks out a single file or folder, and optionally identifies a spot inside that file. For example "/desktop/foo.txt#23" is a location that means "line 23 of /desktop/foo.txt". 
--- The spot is all of the text after the first #, and it is up to any application that supports spots to decide what the string means.
--- A location can also start with a protocol, separated by "://". For example, a cartridge on the bbs is "bbs://nights.p64", which can be treated the same as a read-only folder on the local filesystem.
--- @class Location
local Location = {}

--- Return the path (without the spot).
--- @return string @the path
function Location:path() end

--- Returns just the spot of a location.
--- @return string @the spot
function Location:spot() end

--- Return the protocol of a location, or nil if it is a local path.
---
--- Note that the protocol of a location is not always specified at the start of the string. 
--- For example "/desktop/@" has the protocol "anywhen", and is shorthand for "anywhen://desktop/@".
--- @return string @the protocol of a location
function Location:prot() end

--- Returns the path of the directory the file is inside.
--- @return string @the path of the directory
function Location:dirname() end

--- Returns the file or directory name with its containing directory path and locus omitted.
--- @return string @the file or directory name
function Location:basename() end