#!/usb/usr/bin/lua

require"posix"
require"sapi"
require"cgilua"
require"cgilua.loader"
require"cgilua.post"
require"lxp"
require"xmlrpc.server"

dofile("crapconfig.lua")

cgi2={}
cgilua.urlcode.parsequery (SAPI.Request.getpostdata(2048),cgi2)

cgi=""
for k,v in pairs(cgi2) do
  cgi=cgi..k.."="..v
end

myserver = xmlrpc.server:new()

--- Function to test that XMLRPC in it self is working.
-- @return "Hello world"
function myserver.methods.hello()
	return "Hello world"
end

function myserver.methods.reset()
	return "Reseted"
end

function myserver.methods.getpresets()
	return presets
end


function myserver.methods.tcversion()
	local f=assert(io.popen('/usr/sbin/tc -V','r'))
	local s=assert(f:read('*a'))
	f:close()
	if s=="" then return 0 end
	return s
end

myserver:handle(cgi)
