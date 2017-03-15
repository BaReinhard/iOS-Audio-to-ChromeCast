#!/bin/bash


apt-get install pulseaudio-dlna
systemctl disable pulseaudio-dlna
sed -i -e '$i \pulseaudio-dlna&\n' /etc/rc.local

exit 0
