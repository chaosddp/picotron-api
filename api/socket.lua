---@diagnostic disable: missing-return


--- @class Socket
local Socket = {}

--- Read a string from a socket. This function is not blocking; it will return nothing when there is no data available on the socket.
--- On error, returns nil followed by an error message.
--- @return string | nil 
function Socket:read() end

--- Write string str to socket.
--- @param str string text to write
--- @return number the number of bytes written (which may be less than #str), or nil followed by an error message string
function Socket:write(str) end

--- Close the connection if there is one
function Socket:close() end

--- @alias SocketStatus
---| "ready" @means the socket that is ready to read/write
---| "listening" @means the socket was created with a wildcard address and ready to :accept() connections
---| "closed" @means :close() was called on the socket
---| "disconnected" @means the socket was closed by peer, or disconneted for some other reason

--- Returns a string describing the sockets status:
--- @return SocketStatus current socket status
function Socket:status() end

--- This can be used with sockets that are listening to all traffic on a given port. When a new connection is made with TCP, or a UDP message is receieved from a new address+port, :accept() will return a new socket that can be used to communicate with that particular client, or nil if there are none waiting.
--- @return Socket
function Socket:accept() end

--- Create a socket
--- @param addr string addr is a string consisting of the protocol (tcp:// or udp://), the ip address, followed by a port number ":1234". ipv6 addresses should be enclosed in square brackets.
--- @return Socket
function socket(addr) end