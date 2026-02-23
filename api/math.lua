---@diagnostic disable: missing-return


--- @param x number
--- @return number
function abs(x) end

--- Calculates the arctangent of dy/dx, the angle formed by the vector on the unit circle. The result is adjusted to represent the full circle.
--- @param dx number The horizontal component.
--- @param dy number The vertical component.
--- @return number @The angle of the line from 0,0 to dx,dy.
function atan2(dx, dy) end

--- Calculates the bitwise-and of two numbers. The bnot() function inverts all of the bits of a number.
--- @param x number The first number.
--- @param y number The second number.
--- @return number @The bitwise-and of first and second.
function band(x, y) end

--- Calculates the bitwise not of a number.
--- @param x number
--- @return number @The bitwise-not of num.
function bnot(x) end

--- Calculates the bitwise-or of two numbers.
--- @param x number
--- @param y number
--- @return number @The bitwise-or of first and second.
function bor(x, y) end

--- Calculates the bitwise-xor (exclusive or) of two numbers.
--- @param x number
--- @param y number
--- @return number @The bitwise-xor of first and second.
function bxor(x, y) end

--- @param x number
--- @return number
function ceil(x) end

--- Calculates the cosine of an angle.
--- @param angle number The angle, using a full circle range of 0.0-1.0.
--- @return number
function cos(angle) end

--- @param x number
--- @return number
function flr(x) end

--- Shifts the bits of a number to the right, using logical shift. same as >>>
--- @param num number
--- @param bits number The number of bits to shift.
--- @return number
function lshr(num, bits) end

--- @param x number
--- @param y number
--- @return number
function max(x, y) end

--- @param x number
--- @param y number
--- @return number
function min(x, y) end

--- Returns the middle of three numbers. Also useful for clamping.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function mid(x, y, z) end

--- Generates a random number under the given limit, or returns a random element from a sequence.
--- @param x? number | number[] If no limit or table is supplied, it will default to a limit of 1.0. Values returned will range from 0.0 up to 0.99999 (0x0.ffff). If a sequence-style table is passed instead of a numerical limit, the rnd() function will return a random element from the sequence.
--- @return number
function rnd(x) end

--- Rotates the bits of a number to the left.
--- @param num number 
--- @param bits number The number of bits to rotate.
--- @return number
function rotl(num, bits) end

--- Rotates the bits of a number to the right.
--- @param num number 
--- @param bits number The number of bits to rotate.
--- @return number
function rotr(num, bits) end

--- Returns the sign of a number, 1 for positive, -1 for negative
--- @param x number
--- @return number
function sgn(x) end

--- Shifts the bits of a number to the left.
--- @param x number
--- @param y number
--- @return number
function shl(x, y) end

--- Shifts the bits of a number to the right.
--- @param x number
--- @param y number
--- @return number
function shr(x, y) end

--- Calculates the sine of an angle.
--- @param angle number The angle, using a full circle range of 0.0-1.0 measured clockwise (0.0 to the right).
--- @return number
function sin(angle) end

--- Calculates the square root of a number.
--- @param x number The number. Must be positive.
--- @return number
function sqrt(x) end

--- Initializes the random number generator with an explicit seed value.
--- @param x number The seed value.
function srand(x) end