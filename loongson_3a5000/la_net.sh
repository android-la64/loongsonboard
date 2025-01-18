#!/vendor/bin/sh

/system/bin/ifconfig eth0 up
/system/bin/ifconfig eth0 10.0.2.15
/system/bin/ip rule add from all lookup main pref 1

