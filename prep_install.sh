#!/bin/bash

apt-add-repository ppa:qos/pulseaudio-dlna
apt-add-repository ppa:dantheperson/shairplay-sync
apt-get update
cp etc/asound.conf /etc/asound.conf

exit 0