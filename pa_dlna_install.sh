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
apt-get install pulseaudio-dlna

# Disables pulseaudio-dlna as a systemdaemon
excmd systemctl disable pulseaudio-dlna

# Adds pulseaudio-dlna to the /etc/rc.local file just before the last line (exit 0)
sed -i '$i \pulseaudio-dlna&\n' /etc/rc.local

exit 0
