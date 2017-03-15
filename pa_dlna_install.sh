#!/bin/bash

#============================== Error Handler ==========================
function excmd {
  echo "==================> Executing: $*"
  if ! $*; then
    echo "Exiting script due to error from: $*"
    exit 1
  fi
}
#============================== End Error Handler ======================

apt-get install pulseaudio-dlna
excmd systemctl disable pulseaudio-dlna
excmd sed -i -e '$i \pulseaudio-dlna&\n' /etc/rc.local

exit 0
