#!/bin/sh
export LD_LIBRARY_PATH=/usb/usr/lib/
export LUA_CPATH=";;/usb/usr/lib/lua/?.so"
export LUA_PATH=";;/usb/usr/lib/lua/?.lua;/usb/usr/lib/lua/?/init.lua;/usb/www/cgi-bin/crapnet/?/?.lua;/usb/www/cgi-bin/crapnet/?/init.lua"
cd /usb/www/cgi-bin/crapnet/
/usb/www/cgi-bin/crapnet/do.lua $@
