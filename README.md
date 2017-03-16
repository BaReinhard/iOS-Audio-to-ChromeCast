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
git clone https://github.com/bareinhard/Multiroom-Audio-iOS
cd Multiroom-Audio-iOS
sudo chmod +x ./install.sh
sudo ./install.sh
```
Default Output Sink is set to 4, to change it use `setdefaultsink {sink number}`
To swap sinks during playback use `changesink {sink number}`

## Some Basic Usage

### Changing Sinks
* If you are trying to changesinks after the initial boot-up you will need to run the command `sudo pkill autostream` then run `changesink {sink_number}` As the autostream script (for now) just simply loops and continues to command `pactl` to move the input stream to the default outputstream.
* The command `changesink` does not have the looping effect and only runs once, so if `autostream` is not killed `changesink` will change the sink but `autostream` will immediately change it back to the default set in `/usr/local/bin/autostream` on line 5.
* Another option if you would like to change the sink is to use `setdefaultsink {sink_number}` this will use `sed` and actually modify `autostream` so that the next time the Pi reboots it will use that as the default sink.
### UI Control
* I am in the process of creating a Web UI that will take over the control of setting sinks and changing them during playback. This Web UI will remove the necessity of these other commands, but they will be left in place (but removed from boot) for the lovers of the CLI

Thats it! Enjoy.
