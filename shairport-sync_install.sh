#!/bin/bash

read -p "What is your User Name?: " UserName

#============================== Error Handler ==========================
function excmd {
  echo "==================> Executing: $*"
  if ! $*; then
    echo "Exiting script due to error from: $*"
    exit 1
  fi
}
#============================== End Error Handler ======================


apt-get install shairport-sync
excmd systemctl disable shairport-sync
excmd cp usr/local/bin/shairport-start /usr/local/bin/shairport-start
excmd chmod +x /usr/local/bin/shairport-start
excmd sed -i -e "\$i \su ${UserName} - -c /usr/local/bin/shairport-start&\n" /etc/rc.local
excmd usermod -a -G pulse shairport-sync
excmd usermod -a -G lp shairport-sync
exit 0
