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
echo "set mixer.alsa.channel=" >> ~/.config/cmus/rc
echo "set mixer.alsa.device=" >> ~/.config/cmus/rc
echo "set mixer.oss.channel=PCM" >> ~/.config/cmus/rc
echo "set mixer.oss.device=" >> ~/.config/cmus/rc
echo "set mixer.pulse.restore_volume=1" >> ~/.config/cmus/rc
echo "set output_plugin=pulse" >> ~/.config/cmus/rc
echo "set softvol=false" >> ~/.config/cmus/rc


 
