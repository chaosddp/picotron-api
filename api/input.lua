---@diagnostic disable: missing-return


--- Returns the state of button b for player index pl (default 0 -- means Player 1)
--- @param button number The button to check.
---
--- 0 1 2 3     LEFT RIGHT UP DOWN
---
--- 4 5         Buttons: O X
---
--- 6           MENU
---
--- 7           reserved
---
--- 8 9 10 11   Secondary Stick L,R,U,D
---
--- 12 13       Buttons (not named yet!)
---
--- 14 15       SL SR
--- @param player? number The player index to check. default 
--- @return boolean @false when the button is not pressed
--- @return number @number between 1..255 otherwise
function btn(button, player) end

--- btnp is short for "Button Pressed"; Instead of being true when a button is held down, btnp returns true when a button is down and it was not down the last frame. 
--- It also repeats after 30 frames, returning true every 8 frames after that. 
--- This can be used for things like menu navigation or grid-wise player movement.
--- 
--- The state that btnp() reads is reset at the start of each call to _update60, so it is preferable to use btnp only from inside that call and not from _draw(), which might be called less frequently.
---
--- Custom delays (in frames 60fps) can be set by poking the following memory addresses:
---
--- poke(0x5f5c, delay) -- set the initial delay before repeating. 255 means never repeat.
---
--- poke(0x5f5d, delay) -- set the repeating delay. 
--- @param button number The button to check.
--- @param player? number The player index to check. default 
--- @return boolean @false when the button is not pressed
function btnp(button, player) end

--- returns the state of key k
--- @param k string The key to check.
--- @param raw? boolean get the raw layout, use true as the second parameter to indicate that k should be the name of the raw scancode
--- @return boolean @true if the key is held down
function key(k, raw) end

--- keyp(k) has the same behaviour key(k), but true when the key is pressed or repeating.
--- @param k string The key to check.
--- @param raw? boolean get the raw layout, use true as the second parameter to indicate that k should be the name of the raw scancode
--- @return boolean @false when the key is not pressed
function keyp(k, raw) end

--- read text from the keyboard via the host operating system's text entry system, peektext() can be used to find out if there is some text waiting
--- @return boolean @true if there is text waiting
function peektext() end

--- readtext() can be used to consume the next piece of text
--- @param clear? boolean When "clear" is true, any remaining text in the queue is discarded.
--- @return string @the next piece of text
function readtext(clear) end

--- get mouse state
--- @return number @x of the mouse cursor
--- @return number @y of the mouse cursor
--- @return number @mouse bitfield: 0x1 means left mouse button, 0x2 right mouse button
--- @return number @mouse wheel x delta
--- @return number @mouse wheel y delta
function mouse() end

--- when lock is true, Picotron makes a request to the host operating system's window manager to capture the mouse, allowing it to control sensitivity and movement speed.
---
--- local size, col = 20, 16
---
--- function _draw()
---
---   cls()
---
---   circfill(240, 135, size*4, col)
---
---   local _,_,mb = mouse()
---
---   dx,dy = mouselock(mb > 0, 0.05, 0) -- dx,dy change slowly, stop mouse moving
---
---   size += dx  --  left,right to control size
---
---   col  += dy  --  up,down to control colour
--- end
--- @param lock boolean Whether to lock the mouse.
--- @param event_sensitivity number a number between 0..4 that determines how fast dx, dy change (1.0 means once per picotron pixel)
--- @param move_sensitivity number a number between 0..4: 1.0 means the cursor continues to move at the same speed.
--- @return number @dx, relative since last frame
--- @return number @dy, relative since last frame
function mouselock(lock, event_sensitivity, move_sensitivity) end

--- The input function allows terminal programs to be interactive. Execution of the program is blocked until the user enters a response, and that response is returned:
--- @param prompt? string prompt is a string that is shown to the left of user input. It defaults to "? ".
--- @param flags? number 0x1 hide the prompt once input() has returned
---
--- 0x2 complete the input when a single character is given (do not wait for enter)
---
---0x4 do not block -- return nil when there is no response that frame
function input(prompt, flags) end