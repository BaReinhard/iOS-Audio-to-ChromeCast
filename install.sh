#!/bin/bash
log="./install.log"
echo "" > $log

while [ $UserNameAnswer != "y" ];
do
  read -p "What is your username? :" UserName
  echo "User name is : ${UserName}"
  read -p "Is this correct? (y/n) : " UserNameAnswer
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
echo "${UserName}" | excmd shairport-sync_install.sh | tee -a $log
echo " ======================================================================"



