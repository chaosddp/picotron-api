
--[[
An undo stack is a collection of "patches" that can be applied to get from the current state of a program back to earlier states ("checkpoints"), typically when the user presses ctrl-z some number of times. Picotron provides a simple undo stack implementation that uses uses pod() to view each checkpoint as a string, and then create_delta() to store the incremental changes between them.
]]

--- @class UndoStack
local UndoStack = {}

--- Add an item to the undo stack by calling the stack's save function.
--- @param extra any an optional arbitrary value associated with that checkpoint that is returned by :undo and :redo.
function UndoStack:checkpoint(extra) end

--- Call these when the user presses ctrl-z
function UndoStack:redo() end

--- Call these when the user presses ctrl-y
function UndoStack:undo() end

--- @param save fun():table save is a function that returns a single value that represents the program state (often a table).
--- @param load fun(state:table):void load is a function that restores the state of the program given the same value that was passed to save at that checkpoint.
--- @param pod_flags?  number pod_flags is the argument given to pod() when storing the state. The default is 0x81 (rle-compressed userdata) which works well in most cases.
--- @param item? any item is an optional arbitrary value that is passed to the provided save and load functions. It is normally used to identity which data in the program to operate on, when multiple undo stacks are used (for example, which sprite in a sprite editor that has one undo stack per sprite).
--- @return UndoStack
function create_undo_stack(save, load, pod_flags, item) end