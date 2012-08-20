#!/usb/usr/bin/lua

require"posix"
require"sapi"
require"cgilua"
require"cgilua.loader"
require"cgilua.post"
require"lxp"
require"xmlrpc.server"

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

myserver:register("hello", hello)

myserver:handle(cgi)
