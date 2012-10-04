#!/usr/bin/lua

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
	io.popen("/usr/sbin/tc qdisc delete dev "..clientsideinterface.." root")	
	io.popen("/usr/sbin/tc qdisc delete dev "..serversideinterface.." root")	
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

function myserver.methods.usepreset(preset)
	io.popen("/usr/sbin/tc qdisc add dev "..clientsideinterface.." root handle 1:0 netem delay "..(presets[preset]["latency"]/2).."msec")	
	io.popen("/usr/sbin/tc qdisc add dev "..clientsideinterface.." parent 1:1 handle 10: tbf rate "..(presets[preset]["bandwidth"]["d"]).."kbit buffer 1600 limit 3000")	
	io.popen("/usr/sbin/tc qdisc add dev "..serversideinterface.." root handle 1:0 netem delay "..(presets[preset]["latency"]/2).."msec")	
	io.popen("/usr/sbin/tc qdisc add dev "..serversideinterface.." parent 1:1 handle 10: tbf rate "..(presets[preset]["bandwidth"]["u"]).."kbit buffer 1600 limit 3000")	
	return "OK"
end

myserver:handle(cgi)
