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

apt-add-repository ppa:qos/pulseaudio-dlna
apt-add-repository ppa:dantheperson/shairplay-sync
apt-get update -y
apt-get upgrade -y
echo "" | tee -a /etc/asound.conf
excmd cp /etc/asound.conf /etc/asound.conf.old
excmd cp etc/asound.conf /etc/asound.conf

exit 0
