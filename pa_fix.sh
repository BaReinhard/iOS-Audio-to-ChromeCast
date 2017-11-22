#!/bin/bash

pulseaudio -k
if [ $SUDO_USER ]; then user=$SUDO_USER; else user=`whoami`; fi
export XAUTHORITY=/home/$user/.Xauthority
export DISPLAY=':0'
pulseaudio -nF /etc/pulse/default.pa&
## Uncomment to have pulseaudio-dlna start correctly
# pulseaudio-dlna&
