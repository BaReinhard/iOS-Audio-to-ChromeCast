#!/bin/bash

read -p "What is your User Name?: " UserName
read -p "What is your Device Name?: " AirPlay

#============================== Error Handler ==========================
function excmd {
  echo "==================> Executing: $*"
  if ! $*; then
    echo "Exiting script due to error from: $*"
    exit 1
  fi
}
#============================== End Error Handler ======================

# Installs shairport-sync
apt-get install shairport-sync

# Disables shairport-sync as a system daemon
excmd systemctl disable shairport-sync

# Copies the new shairport-start script which will handle starting shairport
excmd cp usr/local/bin/shairport-start /usr/local/bin/shairport-start

# Makes the new script executable
excmd chmod +x /usr/local/bin/shairport-start

# Inserts a line to /etc/rc.local to allow shairport-sync to execute as a non root user
excmd sed -i -e "\$i \su ${UserName} - -c /usr/local/bin/shairport-start&\n" /etc/rc.local

# Inserts the Chosen AirPlay name into shairport-sync.conf at line 7
excmd sed -i -e "7i \name = "${AirPlay}";\n" /etc/shairport-sync.conf

# Inserts autostream line into shairport-syncs auto caller on connection of AirPlay
excmd sed -i -e '53i \run_this_before_play_begins = "/usr/local/bin/autostream";\n' /etc/shairport-sync.conf

# Insets wait for completion so the script won't block shairport-sync from adding the input stream
excmd sed -i -e '53i \wait_for_completion = "no";' /etc/shairport-sync.conf

# Added shairport-sync to the pulse and lp group
excmd usermod -a -G pulse shairport-sync
excmd usermod -a -G lp shairport-sync
exit 0
