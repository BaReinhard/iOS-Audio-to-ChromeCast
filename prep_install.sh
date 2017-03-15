#!/bin/bash

apt-add-repository ppa:qos/pulseaudio-dlna
apt-add-repository ppa:dantheperson/shairplay-sync
apt-get update -y
apt-get upgrade -y
echo "" | tee -a /etc/asound.conf
cp /etc/asound.conf /etc/asound.conf.old
cp etc/asound.conf /etc/asound.conf

exit 0
