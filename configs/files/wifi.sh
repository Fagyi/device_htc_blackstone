#!/bin/sh

insmod /system/lib/modules/mtdchar.ko
mknod /dev/mtd/mtd0ro c 90 1
mkdir /system/lib/modules/$(uname -r)
dd if=/dev/mtd/mtd0ro of=/data/tempcal bs=8192 count=1 skip=4736
rm /dev/mtd/mtd0ro
rmmod mtdchar
rmdir /system/lib/modules/$(uname -r)
dd if=/data/tempcal of=/proc/calibration bs=1 count=752 skip=64
rm /data/tempcal
chmod 666 /data/misc/wifi/wpa_supplicant.conf
CONFIG=/system/etc/wifi/tiwlan.ini
CALIBRATION=/proc/calibration
/system/bin/wlan_loader -f /system/etc/wifi/Fw1251r1c.bin -e $CALIBRATION -i $CONFIG

