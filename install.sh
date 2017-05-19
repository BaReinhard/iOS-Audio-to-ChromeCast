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
echo " ====================== Installing Node JS ============================"
excmd ./node_install.sh | tee -a $log
echo " ======================= END =========================================="

echo "If you would like to request some other functionality, have suggestions, or found something doesn't work quite right."
echo "Please open an issue at https://github.com/BaReinhard/Multiroom-Audio-iOS/issues"
echo "Thank you, and enjoy your new Multiroom-Audio-iOS project."
echo "Be sure to checkout the new Web UI by simply typing start_web_ui and visit your ip address on port 2221 i.e. 192.168.0.18:2221 in your web browser"
echo "\n"
echo "\n"
# Asks user if they want the server to start on every boot
NODE="NODE"
while [ $NODE != "y" ] && [ $NODE != "n" ];
do
  echo "Would you like to have the WEB UI start every time ${user} logs in?"
  read -p "Make Web UI available at each login? (y/n) :" NODE
done

if [ $NODE = "y" ] then
  echo "start_web_ui" >> "/home/${user}/.profile"
  echo "The Web UI will now be start every time ${user} logs in"
else
  echo "Web UI, will need to be started manually after each reboot, if you every change your mind please run the following command:"
  echo "enable_web_startup"
fi

# Enable Web UI at startup
chmod +x /usr/local/bin/enable_web_startup

# Prompts the user to Reboot, gives the option in case the script failed inside an important step in a sub file
REBOOT="REBOOT"
while [ $REBOOT != "y" ] && [ $REBOOT != "n" ];
do
  echo "It is suggested that you reboot your system at this time"
  read -p "Would you line to reboot now? (y/n) :" REBOOT
done

if [ $REBOOT = "y" ] then
  reboot
else
  echo "Some functionality, may not work until the Raspberry Pi has been restarted"
fi


exit 0



