#!/usr/bin/lua
package.cpath=package.cpath .. ";/usb/usr/lib/lua/?.so"
package.path=package.path .. ";/usb/usr/lib/lua/?.lua;/usb/usr/lib/lua/?/init.lua;./?/?.lua;./?/init.lua"

require"sapi";
require"cgilua";
require"cgilua.loader";
require"cgilua.post";

cgilua.htmlheader()
--cgilua.put(cgilua.QUERY.someinfo)
--for k,v in pairs(cgilua) do print(k,v) end

print("---====---\n")
--cgilua.post.parsedata()
--for k,v in pairs(cgilua.post) do print(k,v) end
--for k,v in pairs(cgilua.POST) do print(k,v) end
--for k,v in pairs(SAPI) do print(k,v) end
--for k,v in pairs(SAPI.Request) do print(k,v) end
--print(SAPI.Request.getpostdata(2048))
cgi={}
cgilua.urlcode.parsequery (SAPI.Request.getpostdata(2048),cgi)
for k,v in pairs(cgi) do print(k,v) end
cgilua.put([[
  <html>
  <head>
    <title>Hello World</title>
  </head>
  <body>
    <strong>Hello World!</strong>
  </body>
  </html>]])
