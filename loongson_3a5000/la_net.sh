#!/vendor/bin/sh

/system/bin/ifconfig eth0 up
/system/bin/ifconfig eth0 192.168.3.10
/system/bin/ip rule add from all lookup main pref 1

