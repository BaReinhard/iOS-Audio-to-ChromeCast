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

# Adds pulseaudio-dlna repo to sources list
echo \n | apt-add-repository ppa:qos/pulseaudio-dlna

# Adds shairport-sync repo to the sources list
echo \n | apt-add-repository ppa:dantheperson/shairplay-sync

# Updates and upgrades the sources and installed files
apt-get update -y
apt-get upgrade -y

# Creates an /etc/asound.conf file in case it doesn't exist so that backing up the /etc/asound.conf file doesn't faile
echo "" | tee -a /etc/asound.conf

# Backs up the existing /etc/asound.conf file to /etc/asound.conf.old
excmd cp /etc/asound.conf /etc/asound.conf.old

# Copies the repo given asound.conf file to the proper location
excmd cp etc/asound.conf /etc/asound.conf

exit 0
