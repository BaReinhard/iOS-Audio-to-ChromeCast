#!/bin/bash

read -p "What is your User Name?: " UserName

apt-get install shairport-sync
systemctl disable shairport-sync
cp usr/local/bin/shairport-start /usr/local/bin/shairport-start
chmod +x /usr/local/bin/shairport-start
sed -i -e "\$i \su ${UserName} - -c /usr/local/bin/shairport-start&\n" /etc/rc.local
usermod -a -G pulse shairport-sync
usermod -a -G lp shairport-sync
exit 0
