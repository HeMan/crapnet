dev = root@192.168.128.1:/usb/www/cgi-bin/crapnet/
prod = root@192.168.128.174
get:
	rsync -va $(dev) ./

put:
	rsync -va ./ $(dev)

install:
	scp -r ./do.lua ./crapconfig.lua $(prod):/www/cgi-bin/crapnet/
	scp -r ./sapi ./xmlrpc ./cgilua.git/src/cgilua/ $(prod):/usr/lib/lua/
	scp -r ./cgilua.git/src/cgilua/cgilua.lua $(prod):/usr/lib/lua/
