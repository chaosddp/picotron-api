---@diagnostic disable: missing-return

--- Add value val to the end of table tbl. Equivalent to: tbl[#tbl + 1] = val
--- @param tbl table The table to add to.
--- @param val any The value to add.
--- @param index? number The index to add the value to. Defaults to the end of the table.
function add(tbl, val, index) end

--- Delete the first instance of value VAL in table TBL. The remaining entries are shifted left one index to avoid holes.
---
--- Note that val is the value of the item to be deleted, not the index into the table. (To remove an item at a particular index, use deli instead). del() returns the deleted item, or returns no value when nothing was deleted.
--- @param tbl table The table to delete from.
--- @param val any The value to delete.
function del(tbl, val) end

--- Like del(), but remove the item from table tbl at index. When index is not given, the last element of the table is removed and returned.
--- @param tbl table The table to delete from.
--- @param index? number The index to delete. Defaults to the last index.
function deli(tbl, index) end

--- Returns the length of table t (same as #tbl) When val is given, returns the number of instances of VAL in that table.
--- @param tbl table The table to count.
--- @param val? any The value to count.
--- @return number @The length of the table
function count(tbl, val) end

--- Used in for loops to iterate over all items in a table (that have a 1-based integer index), in the order they were added.
---
--- t = {11,12,13}
---
--- add(t,14)
---
--- add(t,"hi")
---
--- for v in all(t) do print(v) end -- 11 12 13 14 hi
---
--- print(#t) -- 5
--- @param tbl table The table to iterate over.
function all(tbl) end

--- For each item in table tbl, call function func with the item as a single parameter.
--- @param tbl table The table to iterate over.
--- @param func fun(a:any) The function to call for each item.
function foreach(tbl, func) end
