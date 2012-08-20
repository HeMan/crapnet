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

function hello() 
	return "Hello world"
end

function reset()
	return "Reseted"
end

function getpresets()
	return presets
end


myserver:register("hello", hello)
myserver:register("reset", reset)
myserver:register("getpresets", getpresets)

myserver:handle(cgi)
