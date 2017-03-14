# Multiroom-Audio-iOS
All the Pertinent files for setting up a Raspberry Pi to server AirPlay music to Multiple Chromecasts

## What's needed?
* Raspberry Pi Running Ubuntu MATE
* 1+ Chromecast Audio's
* Wifi Network
* Speakers
* The iOS Google Home app

## What does this do?
This project will setup a Raspberry Pi running Ubuntu MATE as a "middle-man" between the iOS Device and the Google Chromecasts. The Raspberry Pi will be running `shairport-sync` and `pulseaudio-dlna`. `Shairport-sync` allows for iOS devices to stream audio via AirPlay. `Pulseaudio-dlna` allows for UPnP devices on the network to be recognized and setup as `pulseaudio` sinks, which are then available to stream audio to.
