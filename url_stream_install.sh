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

excmd apt-get install cmus -y
mkdir ~/.config/cmus
cat << EOT >> ~/.config/cmus/rc
set mixer.alsa.channel=
set mixer.alsa.device=
set mixer.oss.channel=PCM
set mixer.oss.device=
set mixer.pulse.restore_volume=1
set output_plugin=pulse
set softvol=false
EOT

 
