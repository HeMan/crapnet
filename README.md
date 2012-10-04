Crapnet
=======

Crapnet is a tool to make your router to perform worse. Why? Because
you sometimes need to test applications over a network connection that
do add latency, lowers the bandwidth or drops some packages.

It's built as a XMLRPC server that configures the Linux kernel with
tc and iptables.

Prereqs
-------
Crapnet is built to be ran on a OpenWRT router with a few extra packages.

* OpenWRT 10.03 (or newer, 12.09 beta is tested)
* luaexpat
* luafilesystem
* tc
* kmod-netem

### Unittests
You can find unittests at [crapnet-test][1]
[1]: https://github.com/HeMan/crapnet-test
