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

# Installs Pulseaudio-dlna (talk about overcommenting)
apt-get install pulseaudio-dlna -y

mv ~/.config/pulse ~/.config/pulse.bad

# Replace daemon-binary and autospawn with proper values
sed -i "s/; daemon-binary.*/daemon-binary = false/" /etc/pulse/client.conf 
sed -i "s/; autospawn.*/autospawn = no/" /etc/pulse/client.conf 

exit 0
