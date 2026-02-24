---@diagnostic disable: missing-return


--- @class Userdata
local Userdata = {}

--- width of a userdata
--- @return number @width of userdata
function Userdata:width() end

--- height of a userdata
--- @return number @height of userdata
function Userdata:height() end

--- @return number @width of userdata
--- @return number @height of userdata
function Userdata:attribs() end

--- get n values starting at x (or x, y for 2d userdata), or 0 if out of range.
--- @param x number starting x index
--- @param y? number starting y index
--- @param n number n values to get
--- @return number[]
--- @overload fun(x:number, n:number):number[]
function Userdata:get(x , y, n) end

--- Set one or more value starting at x (or x, y for 2d userdata).
--- @param x number starting x index
--- @param y? number starting y index
--- @param val0 number
--- @param val1? number
--- @param ...? number[]
function Userdata:set(x, y, val0, val1, ...) end

--- Return a row of a 2d userdata (0 is the first row or column), or nil when out of range.
--- @param i number row index
--- @return number[]
function Userdata:row(i) end

--- Return a column of a 2d userdata (0 is the first row or column), or nil when out of range.
--- @param i number column index
--- @return number[]
function Userdata:column(i) end

--- Copy a region of one userdata to another.
--- @param dest Userdata
--- @param src_x number
--- @param src_y number
--- @param dest_x number
--- @param dest_y number
--- @param width number
--- @param height number
function Userdata:blit(dest, src_x, src_y, dest_x, dest_y, width, height) end

--- Change the type or size of a userdata. When changing data type, only integer types can be used.
--- @param data_type UserDataType
--- @param width number
--- @param height number
--- @overload fun(data_type:UserDataType)
function Userdata:mutate(data_type, width, height) end

--- linearly interpolate between two elements of a userdata
--- @param offset number offset is the flat index to start from (default: 0)
--- @param len number len is the length (x1-x0) of the lerp, including the end element but not the start element.
--- @param el_stride number el_stride is the distance between elements (default: 1)
--- @param num_lerps? number Multiple lerps can be performed at once using num_lerps, and lerp_stride. lerp_stride is added to offset after each lerp.
--- @param lerp_stride? number Multiple lerps can be performed at once using num_lerps, and lerp_stride. lerp_stride is added to offset after each lerp. 
--- @return number[]
--- @overload fun(offset:number, len:number, el_stride: number):number[]
function Userdata:lerp(offset, len, el_stride, num_lerps, lerp_stride) end

--- Return a copy of userdata cast as a different type. When converting to ints, f64 values are flr()'ed and out of range values overflow.
--- @param data_type UserDataType
--- @param dest? Userdata
--- @return Userdata
--- @overload fun(data_type: UserDataType):Userdata
function Userdata:convert(data_type, dest) end

--- Sort a 2d userdata of any type by the value found in the index column (0 by default).
--- @param index number column index to sort
--- @param descending? boolean When descending is true, sort from largest to smallest.
--- @overload fun(index:number):void
function Userdata:sort(index, descending) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:add(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:sub(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:mul(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:div(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:mod(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:pow(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:band(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:bor(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:bxor(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:max(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- @param other Userdata | number
--- @param dest? Userdata | boolean dest is an optional output userdata, which can be the boolean value true to mean "write to self". This can be used to avoid the cpu overhead of creating new userdata objects.
--- @param src_offset? number Flat offsets into src can be given
--- @param dest_offset? number Flat offsets into dest can be given
--- @param len? number number of elements to process
--- @param src_stride? number src_stride specify the number of elements between the start of each span for src respectively
--- @param dest_stride? number dest_stride specify the number of elements between the start of each span for dest respectively
--- @param spans? number 
--- @return Userdata
--- @overload fun(other:Userdata|number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number):Userdata
--- @overload fun(other:Userdata|number, dest:Userdata|boolean, src_offset:number, dest_offset:number, len:number):Userdata
function Userdata:min(other, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- Take values from the userdata at locations specified by idx.
--- @param idx Userdata a i32 userdata, where each value is a flat index into the userdata
--- @param dest? Userdata When dest is not specified, the userdata returned by :take is the same shape as idx. When dest (a userdata of the same type) is given, values are written starting at dest_offset, also a flat index.
--- @param idx_offset? number
--- @param dest_offset? number
--- @param span_len? number The default span_len is 1, in which case the default shape of the output is the same as the shape of idx.
--- @param idx_stride? number idx_stride is applied between each index, and defaults to 1.
--- @param dest_stride? number dest_stride is applied after writing each span. It defaults to span_len.
--- @param spans? number
--- @return Userdata
--- @overload fun(idx:Userdata):Userdata
--- @overload fun(idx:Userdata, dest:Userdata):Userdata
--- @overload fun(idx:Userdata, dest:Userdata, idx_offset:number, dest_offset:number):Userdata
--- @overload fun(idx:Userdata, dest:Userdata, idx_offset:number, dest_offset:number, span_len:number):Userdata
function Userdata:take(idx, dest, idx_offset, dest_offset, span_len, idx_stride, dest_stride, spans) end

--- Multiply two matrixes together
--- @param m1 Userdata matrix to multiply
--- @param m_out? Userdata | boolean When m_out is given, the output is written to that userdata. Otherwise a new userdata is created of width m1:width() and height m0:height().
--- @param batch_height? number When batch_height is given, multiple matrices can be multiplied in a single call by packing them into a userdata that is matrix_height * number_of_matrices high
--- @return Userdata
--- @overload fun(m1:Userdata):Userdata
--- @overload fun(m1:Userdata, m_out:Userdata|boolean):Userdata
function Userdata:matmul(m1, m_out, batch_height) end

--- @param m Userdata
--- @param m_out? Userdata | boolean
--- @return Userdata
--- @overload fun(m:Userdata):Userdata
function Userdata:matmul2d(m, m_out) end

--- @param m Userdata
--- @param m_out? Userdata | boolean
--- @return Userdata
--- @overload fun(m:Userdata):Userdata
function Userdata:matmul3d(m, m_out) end

--- @param m_out? Userdata | boolean
--- @return Userdata
--- @overload fun():Userdata
function Userdata:transpose(m_out) end

--- @return Userdata
function Userdata:abs() end

--- returns -1 for negative values and 1 for positive values and zero
--- @return Userdata
function Userdata:sgn() end

--- returns -1 for negative values and 1 for positive values, and 0 for zero
--- @return Userdata 
function Userdata:sgn0() end

--- @return number
function Userdata:magnitude() end

--- @param v Userdata 
--- @return number
function Userdata:distance(v) end

--- @param v Userdata
--- @return number
function Userdata:dot(v) end

--- @param v Userdata
--- @param v_out? Userdata
--- @return Userdata
--- @overload fun(v:Userdata):Userdata
function Userdata:cross(v, v_out) end

--- read from ram into an integer-typed userdata.
--- @param addr number addr is the address to peek
--- @param offset number offset is the userdata element to start from (flattened 1d index)
--- @param elements number the number of elements to peek
--- @return Userdata
function Userdata:peek(addr, offset, elements) end

--- write from ram into an integer-typed userdata.
--- @param addr number addr is the address to poke
--- @param offset number offset is the userdata element to start from (flattened 1d index)
--- @param elements number the number of elements to poke
--- @return Userdata
function Userdata:poke(addr, offset, elements) end



--- Applies operator op (add, mult etc) to each element and written to a new userdata. All parameters are optional.
---
--- For each element, the LHS is taken from the calling userdata, and the RHS is taken from the "src" userdata: dest_val = ud_val {op} src_val
-- function Userdata:op(src, dest, src_offset, dest_offset, len, src_stride, dest_stride, spans) end

--- A convenience function for constructing 1d vectors of f64s.
--- @param ... number[]
--- @return Userdata
function vec(...) end

--- @alias UserDataType "u8" | "i16" | "i32" | "i64" | "f64"

--- Create a Userdata with a data type
--- @param data_type UserDataType  The first 4 are integers which are unsigned (u) or signed(i), and with a given number of bits. The last one is for 64-bit floats, and can be used to implement vectors and matrices.
--- @param width number  
--- @param height number
--- @param data? string a string of hexadecimal values encoding the initial values for integer values, or a list of f64s separated by commas.
--- @return Userdata
--- @overload fun(data:string):Userdata
--- @overload fun(data_type: UserDataType, width: number, height: number):Userdata
function userdata(data_type, width, height, data) end

--- Copy a region of one Userdata to another.
--- @param src Userdata
--- @param dest Userdata
--- @param src_x number
--- @param src_y number
--- @param dest_x number
--- @param dest_y number
--- @param width number
--- @param height number
function blit(src, dest, src_x, src_y, dest_x, dest_y, width, height) end

--- Multiply two matrixes together. matmul is part of the userdata metatable, so it can also be called using the equivalent form: m0:matmul(m1).
--- @param m0 Userdata matrix 0 to multiply
--- @param m1 Userdata matrix 1 to multiply
--- @param m_out? Userdata When m_out is given, the output is written to that userdata. Otherwise a new userdata is created of width m1:width() and height m0:height().
--- @param batch_height? number When batch_height is given, multiple matrices can be multiplied in a single call by packing them into a userdata that is matrix_height * number_of_matrices high
--- @return Userdata
--- @overload fun(m0:Userdata, m1:Userdata):Userdata
--- @overload fun(m1:Userdata, m1:Userdata, m_out: Userdata):Userdata
function matmul(m0, m1, m_out, batch_height) end

--- For 3d 4x4 transformation matrices, matmul3d can be used.
---
--- matmul3d implements a common optimisation in computer graphics: it assumes that the 4th column of the matrix is (0,0,0,1), and that the last component of LHS vector (the mysterious "w") is 1. Making these assumptions still allows for common tranformations (rotate, scale, translate), but reduces the number of multiplies needed, and so uses less cpu.
---
--- matmul3d can be used on any size vector as only the first 3 components are observed, and anything larger than a 3x4 userdata for the RHS matrix; again, excess values are ignored.
---
--- So apart from the cpu and space savings, matmul3d can be useful for storing extra information within the same userdata (such as vertex colour or uv), as it will be ignored by matmul3d(). matmul() is less flexible in this way, as it requires unambiguous matrix sizes.
---
--- When batch_height is given, multiple matrices can be multiplied at once by packing them into a single userdata. matmul3d() accepts batch_height 1 (for multiplying many vectors) or 3 (for multiplying many matrices). See /system/demos/treegen.p64 for an example of a batch multiply performed using matmul3d().
--- @param m0 Userdata matrix 0 to multiply
--- @param m1 Userdata matrix 1 to multiply
--- @param m_out? Userdata When m_out is given, the output is written to that userdata. Otherwise a new userdata is created of width m1:width() and height m0:height().
--- @param batch_height? number When batch_height is given, multiple matrices can be multiplied in a single call by packing them into a userdata that is matrix_height * number_of_matrices high
--- @return Userdata
--- @overload fun(m0:Userdata, m1:Userdata):Userdata
--- @overload fun(m0:Userdata, m1:Userdata, m_out:Userdata):Userdata
function matmul3d(m0, m1, m_out, batch_height) end

--- Map the contents of an integer-type userdata to ram.
---
--- Userdata does not need to be sized to fit 4k boundaries, with one exception: addresses below 0x10000 must always be fully mapped, and memmap calls that break that rule return with no effect.
--- @param ud Userdata 
--- @param addr number addr is the starting memory address, which must be in 4k increments (i.e. end in 000 in hex).
function memmap(ud, addr) end

--- Unmap userdata from ram. When an address is given, only the mapping at that address is removed. This is relevant only when there are multiple mappings of the same userdata to different parts of memory.
--- @param ud Userdata
--- @param addr? number
--- @overload fun(ud:Userdata):void
function unmap(ud, addr) end
