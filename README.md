# Multiroom-Audio-iOS
All the Pertinent files for setting up a Raspberry Pi to server AirPlay music to Multiple Chromecasts

## What's needed?
* Raspberry Pi Running Ubuntu MATE
* 2+ Chromecast Audio's, will work with one but then its not really multiroom audio
* Wifi Network
* Speakers
* The iOS Google Home app

## What does this do?
This project will setup a Raspberry Pi running Ubuntu MATE as a "middle-man" between the iOS Device and the Google Chromecasts. The Raspberry Pi will be running `shairport-sync` and `pulseaudio-dlna`. `Shairport-sync` allows for iOS devices to stream audio via AirPlay. `Pulseaudio-dlna` allows for UPnP devices on the network to be recognized and setup as `pulseaudio` sinks, which are then available to stream audio to.

## Install

First setup your chromecasts and create a multi device group via the app Google Home, then move on to the software

```
sudo apt-add-repository ppa:qos/pulseaudio-dlna
sudo apt-add-repository ppa:dantheperson/shairplay-sync
sudo apt-get update
sudo apt-get install pulseaudio-dlna
sudo apt-get install shairport-sync
sudo systemctl disable pulseaudio-dlna
sudo systemctl disable shairport-sync
git clone https://github.com/bareinhard/Multiroom-Audio-iOS
cd Multiroom-Audio-iOS
sudo cp etc/rc.local /etc/rc.local
sudo chmod +x /etc/rc.local
sudo cp usr/local/bin/shairport-start
sudo chmod +x /usr/local/bin/shairport-start
sudo cp etc/asound.con /etc/asound.conf

# Currently working on a script that will automatically move the new input sink from shairport-sync to the desired output stream to the chromecast.
# It can be done manually via:
pactl list sinks   # You will get a list of sinks you want to sink to
pactl list sink-inputs   # You will get an input sink only after starting to stream audio and connecting to AirPlay
pactl move-input-sink {input sink #} {output sink #}
```


Thats it! Enjoy.
