#!/bin/bash
log="./install.log"

# Create the log file if it doesn't already exist
echo "" | tee -a $log

# Make all files executable if they aren't already
chmod +x *
if [ $SUDO_USER ]; then user=$SUDO_USER; else user=`whoami`; fi

# Prompts user for User Name of the user they are using to login (needed due to script being run as root)


# Prompts user for AirPlay speaker name, to let them use a custom name for the speaker
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
excmd ./prep_install.sh | tee -a $log
echo " ======================================================================"
echo " ====================== Installing Pulseaudio-dlna ===================="
excmd ./pa_dlna_install.sh | tee -a $log
echo " ======================================================================"
echo " ====================== Installing Shairport-Sync ====================="
{ echo "${user}"; echo "${AirPlayName}"; } | excmd ./shairport-sync_install.sh | tee -a $log
echo " ======================================================================"

# Prompts the user to Reboot, gives the option in case the script failed inside an important step in a sub file
REBOOT="REBOOT"
while [ $REBOOT != "y" ] && [ $REBOOT != "n" ];
do
  echo "It is suggested that you reboot your system at this time"
  read -p "Would you line to reboot now? (y/n) :" REBOOT
done
exit 0



