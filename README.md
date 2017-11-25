# Multiroom-Audio-iOS
Audio Streaming from iOS devices to Google Chromecast Audio Devices.

# Pending Changes
* Rewriting in React!

# Searching for Dev Help!
* If you have an interest in making this project better, feel free to fork it and make revisions as you see fit. I will gladly merge new features given there are no breaking changes.

## What's needed?
* Raspberry Pi Running Ubuntu MATE
* 2+ Chromecast Audio's, will work with one but then its not really multiroom audio
* Wifi Network
* Speakers
* The iOS Google Home app

## What does this do?
This project will setup a Raspberry Pi running Ubuntu MATE as a "middle-man" between the iOS Device and the Google Chromecasts. The Raspberry Pi will be running `shairport-sync` and `pulseaudio-dlna`. `Shairport-sync` allows for iOS devices to stream audio via AirPlay. `Pulseaudio-dlna` allows for UPnP devices on the network to be recognized and setup as `pulseaudio` sinks, which are then available to stream audio to.

## Install

First setup your chromecasts and create a multi device group via the app Google Home, then move on to the software : (Be sure to follow the prompts, it will ask you to name your device and then after completion will ask your to reboot (it is recommended that you do))

```
git clone https://github.com/bareinhard/iOS-Audio-to-ChromeCast-Multiroom
cd iOS-Audio-to-ChromeCast-Multiroom
sudo chmod +x ./install.sh
sudo ./install.sh
```

## Usage

Once you have completed the Install, simply open your browser and navigate to whatever ip address your Raspberry Pi is on, on Port 2221, i.e. 192.168.0.26:2221. From there you will be able to control which sink to play to. You will first need to connect to the Raspberry Pi from your iOS device via AirPlay, then you will be able to change the sinks via the Web Browser. To update the browsers you can simply refresh the page or click the 'refresh sinks' button.


![Web UI Controls](https://raw.githubusercontent.com/BaReinhard/iOS-Audio-to-ChromeCast-Multiroom/master/node/public/app/img/multiroomaudio.png)
Thats it! Enjoy...
