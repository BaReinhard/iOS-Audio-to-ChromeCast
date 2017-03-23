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
* Web UI is supported, but you need to manually install node. All the files are in the node folder. You may also need to install a few modules manually as well.

In order to get the sinks to properly update you will also need to move a few files to correct places:
the following files

```
# Located in the JSONFormatting Directory will need to be placed in /home/username/
genSinks.sh
executeJson.sh
jsonString.sh

# Located in the home directory will need to be placed in /home/username/
changeVolume.sh
runningSink.sh

```

I am still tracking down an issue where, you will have to refresh the page twice in order to get the most up to date sinks displayed on the Web UI, this should be a simple fix and done relativel soon.


![Web UI Controls](https://scontent-lax3-2.cdninstagram.com/t51.2885-15/e35/17267738_399689447076638_779634115816194048_n.jpg)
Thats it! Enjoy.
