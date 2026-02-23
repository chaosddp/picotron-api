---@diagnostic disable: missing-return


--- print a string to the host operating system's console for debugging.
function printh(str) end

--- Returns a table of environment variables given to the process at the time of creation.
---
--- The contents of the environment never change during a program's lifetime.
--- @return table
function env() end

--- Cause a crash showing description (a string) at the top of the stack trace.
--- @param description? string The description to show.
--- @overload fun()
function error(description) end

--- Halt the program and print a message to terminal. This is meant to be used during development, when running the present working cart with ctrl-r.
---
--- Unlike error, stop() does not cause a crash but simply suspends the program. 
--- It can still be resumed from terminal ("> resume") when it is the present working cartridge.
--- @param message? string The message to print.
--- @overload fun()
function stop(message) end

--- Immediately end the program. This can be used to terminate a terminal program early.
function exit() end

--- if condition is false, stop the program and print message if it is given. this can be useful for debugging cartridges, by assert()'ing that things that you expect to be true are indeed true.
--- @param condition boolean condition to check
--- @param message? string message to print
--- @overload fun(condition)
function assert(condition, message) end

--- Returns the number of seconds elapsed since the cartridge was run.
---
--- This is not the real-world time, but is calculated by counting the number of times _update60 is called. multiple calls of time() from the same frame return the same result.
--- @return number @number of seconds elapsed
function time() end

--- Returns the number of seconds elapsed since the cartridge was run.
---
--- This is not the real-world time, but is calculated by counting the number of times _update60 is called. multiple calls of time() from the same frame return the same result.
--- @return number @number of seconds elapsed
function t() end

--- Returns the current day and time formatted using Lua's standard date strings.
---
--- show the current UTC time (use this for timestamps)
---
--- date()
--- 
--- show the current local time
---
--- date("%Y-%m-%d %H:%M:%S")
--- 
--- convert a UTC date to local time
---
--- date("%Y-%m-%d %H:%M:%S", "2024-03-14 03:14:00")
--- 
--- local time 1 hour ago
---
--- date("%Y-%m-%d %H:%M:%S", nil, -60*60)
--- @param format string specifies the output string format, and defaults to "!%Y-%m-%d %H:%M:%S" (UTC) when not given. Picotron timestamps stored in file metadata are stored in this format.
--- @param t string specifies the moment in time to be encoded as a string, and can be either an integer (epoch timestamp) or a string indicating UTC in the format: "!%Y-%m-%d %H:%M:%S". When t is not given, the current time is used.
--- @param delta number number of seconds to add to t.
--- @return string
function date(format, t, delta) end

--- Read the contents of the clipboard.
--- @return string
function get_clipboard() end

---  write the contents of the clipboard.
--- The value is always a single plaintext string; to copy structured objects to the clipboard, use pod() and unpod() to decode them. Note that plaintext format must be used, so use flags 0x0 or 0x7 with pod():
--- @param text string The text to write to the clipboard.
function set_clipboard(text) end

--- @enum SystemState
local SysemState = {
    ["memory"] = 0,
    ["cpu"] = 1,
    ["reserved"] = 2,
    ["raw_memory"] = 3,
    ["runtime"] = 4,
    ["fps"] = 5,
    ["epoch_time"] = 86,
    ["timezone_delta"] = 87,
    ["web_player_cart_id"] = 101,
    ["web_location"] = 150,
    ["web_location_pathname"] = 151,
    ["web_location_host"] = 152,
    ["web_location_hash"] = 153,
}

--- Get system status
--- @param x SystemState system state
--- @return string | number @system status
function stat(x) end

--- Create a process given a program path, and an environment table.
--- @param prog_path string prog_path is the name of the program to run; either a cartridge (.p64) or .lua file:
--- @param env table env is a table that is added to the program's environment, accessible from env(). For example, to run xyzine to autoplay mode (skips the title screen, as if running as a screensaver):
--- @return number? @process id if successful, nil otherwise
function create_process(prog_path, env) end

--- wrangle_working_file installs a collection of callbacks and menu items in order to support a standard pattern of loading and saving files. It is most useful for editors, where each tab is editing a single file (the working file), and when the user expects changes to file in /ram/cart to be automatically saved.
---
--- For file choosing that doesn't fit that pattern (e.g. "Export Image As..."), use chooser() instead.
---
--- @param options table save_state a function that returns the object to be saved (e.g. a table) load_state a function that takes the object to load and updates the program state untitled_filename the initial working file. The extension is also used as the default. save_spot return a small fragment of text that describes the cursor (e.g. "33") jump_to_spot takes a string ("33") and jumps to that spot (e.g. line number / map coordinate) state_hint a function used for efficient unsaved changes detection
function wrangle_working_file(options) end

--- Open a location using /system/util/open.lua
--- @param location string location is a string, and can be relative to the present working directory. 
function open(location) end

--- @class ChooserOptions
--- @field path? string        the starting directory to browser from (can be relative)
--- @field intention? string   a string observed by filenav: "save_file_as", "select_file"
--- @field title? string       the title of the filenav window
--- @field verb? string        the text on the button (default: "Select")
--- @field prompt? string      the text on the left of button
local ChooserOptions = {}

--- Open a file chooser.
---
--- In its simplest form, chooser() allows the user to choose one or more existing files and folders, as if they were dragged and dropped from filenav into the application's window.
---
--- Choosing one or more files, cartridges or folders:
---
--- chooser({
---   path = "/desktop",
---   title = "Choose a desktop",
--- }, function(msg)
---   for i=1,#msg.item do
---     print("item: "..msg.item[i].location)
---   end
--- end)
---
--- Choose a single file via a menu item by using the "select_file" intention:
---
--- window(240,80)
--- menuitem{
---   id = "select",
---   label = "Select File",
---   action = function()
---     chooser(
---       {
---         path = "/", -- starting path
---         intention = "select_file"
---         -- intention = "save_file_as" -- same but prompt for overwrites
---       },
---       function(msg) fn = msg.filename end
---     )
---   end
--- }
--- function _draw()
---   cls(7)
---   if (fn) print("selected: "..fn, 20,20, 1)
--- end
--- @param options? ChooserOptions options is a table of options for the chooser.
--- @param handler? fun(msg: any):void handler is a function that handles the response. It is similar to the function given to on_event(), but handles just a single message.
function chooser(options, handler) end

--- Send a message to process proc_id
--- @param proc_id number proc_id is the process id to send the message to.
--- @param msg table msg is the message that should include at least an "event" field that is used to identify a matching event handler in the receiving process
--- @param reply? boolean When reply is true, send_message blocks until the process responds with a reply. For example, paste the following in to terminal to set up a headless process that responds to "get_id" messages
function send_message(proc_id, msg, reply) end

--- Create an event handler for the current process
--- @param event string event is a string that matches the event field of the message
--- @param func fun(msg:table):void  a function that handles the message
function on_event(event, func) end