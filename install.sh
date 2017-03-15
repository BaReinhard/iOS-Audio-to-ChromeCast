#!/bin/bash
log="./install.log"
echo "" | tee -a $log
chmod +x ./*
UserNameAnswer="UserNameAnswer"
while [ $UserNameAnswer != "y" ];
do
  read -p "What is your username? : " UserName
  echo "User name is : ${UserName}"
  read -p "Is this correct? (y/n) : " UserNameAnswer
done
AirPlayNameAnswer="AirPlayNameAnswer"
while [ $AirPlayNameAnswer != "y" ];
do
  read -p "What you would like to name your AirPlay Speaker? : " AirPlayName
  echo "AirPlay Speaker name is : ${AirPlayName}"
  read -p "Is this correct? (y/n) : " AirPlayNameAnswer
done
#============================== Error Handler ==========================
function excmd {
  echo "==================> Executing: $*"
  if ! $*; then
    echo "Exiting script due to error from: $*"
    exit 1
  fi
}
#============================== End Error Handler ======================
echo " =========================== Starting Prep Work ======================="
excmd prep_install.sh | tee -a $log
echo " ======================================================================"
echo " ====================== Installing Pulseaudio-dlna ===================="
excmd pa_dlna_install.sh | tee -a $log
echo " ======================================================================"
echo " ====================== Installing Shairport-Sync ====================="
{ echo "${UserName}"; echo "${AirPlayName}";} | excmd shairport-sync_install.sh | tee -a $log
echo " ======================================================================"

# Prompts for Reboot
REBOOT="REBOOT"
while [ $REBOOT != "y" ] && [ $REBOOT != "n" ];
do
  echo "It is suggested that you reboot your system at this time"
  read -p "Would you line to reboot now? (y/n) :" REBOOT
done
exit 0



