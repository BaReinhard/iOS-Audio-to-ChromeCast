#!/bin/bash
if [ $SUDO_USER ]; then user=$SUDO_USER; else user=`whoami`; fi
#============================== Error Handler ==========================
function excmd {
  echo "==================> Executing: $*"
  if ! $*; then
    echo "Exiting script due to error from: $*"
    exit 1
  fi
}
#============================== End Error Handler ======================

# Install nodejs
apt-get install nodejs -y

# Install Node Package Manager
apt-get install npm -y

# Add nodejs startup command to .profile
echo "nodejs /home/${user}/projects/node/server.js" >> "/home/${user}/.profile"

# Move Necessary files to home directory
cp JSONFormatting/* "/home/${user}/"

# Make files executable
chmod +x "/home/${user}/"*

# Make projects folder
mkdir "/home/${user}/projects"

# Move node contents to projects folder
cp node -R "/home/${user}/projects/"

# Add speaker.png
wget https://cdn4.iconfinder.com/data/icons/proglyphs-multimedia/512/Speaker-512.png -P "/home/${user}/projects/node/public/app/img/"

# Name Speaker-512.png to speaker.png
mv "/home/${user}/projects/node/public/app/img/Speaker-512.png" "/home/${user}/projects/node/public/app/img/speaker.png"

# Move start_web_ui to /usr/local/bin
cp usr/local/bin/start_web_ui /usr/local/bin/start_web_ui

# Make it executable
chmod +x /usr/local/bin/start_web_ui

# Navigate to proper folder
cd "/home/${user}/projects/node/"

# Install Express
npm install express

# Install Morgan
npm install morgan

# Install Body-Parser
npm install body-parser

# Install method-override
npm install method-override

# Install Angularjs-slider
npm install angularjs-slider
