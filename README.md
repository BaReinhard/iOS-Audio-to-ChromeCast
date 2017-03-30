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

## Some Basic Usage

### Changing Sinks
* If you are trying to changesinks after the initial boot-up you will need to run the command `sudo pkill autostream` then run `changesink {sink_number}` As the autostream script (for now) just simply loops and continues to command `pactl` to move the input stream to the default outputstream.
* The command `changesink` does not have the looping effect and only runs once, so if `autostream` is not killed `changesink` will change the sink but `autostream` will immediately change it back to the default set in `/usr/local/bin/autostream` on line 5.
* Another option if you would like to change the sink is to use `setdefaultsink {sink_number}` this will use `sed` and actually modify `autostream` so that the next time the Pi reboots it will use that as the default sink.
### The Commands
* `autostream` - this script continuously loops and sets any input sink to the default sink set in the script (default is sink 4)
* `setdefaultsink {sink_number}` - this will modify the default sink inside of `autostream`, used to set config of default sink
* `changesink {sink_number}` - this is almost identical to `autostream`, but it does not loop and takes a parameter to change the current input sink to the passed variable as the output sink. Running this will require that you run `sudo pkill autostream` prior to using `changesink`.
### UI Control
* Web UI is now supported and working out the box, simply run the command `start_web_ui`


![Web UI Controls](https://photos-2.dropbox.com/t/2/AABYb6v2J3CIXWJHmwshm7Kx5qT3lum01H08gnl7JYDRAg/12/207990524/png/32x32/1/_/1/2/Screenshot%202017-03-29%2019.49.56.png/EKrw-ZwBGPYbIAcoBw/-VZ49fsE6-ylplRu-lsiNIElvRvkJlqjFD6ztptFRxw?size=1280x960&size_mode=3)
Thats it! Enjoy.
