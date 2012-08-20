get:
	rsync -va root@192.168.128.1://usb/www/cgi-bin/crapnet/ ./

put:
	rsync -va ./ root@192.168.128.1://usb/www/cgi-bin/crapnet/
