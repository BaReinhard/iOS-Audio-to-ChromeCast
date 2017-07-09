# Multiroom-Audio-iOS
Audio Streaming from iOS devices to Google Chromecast Audio Devices.

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
* If you are trying to changesinks will need to run the command  `changesink {sink_number}` or use the Web UI, more information below.
### The Commands
* `changesink {sink_number}` - this is almost identical to `autostream`, but it does not loop and takes a parameter to change the current input sink to the passed variable as the output sink.
### The WEB UI Commands
* `start_web_ui` - this command will start `nodejs` with the proper `server.js` file location in `/home/user/projects/node`. You will be able to see the Web UI at your Pi's ip address on port 2221 inside your favorite web browser, i.e. 192.168.0.18:2221. The Web UI was made for use with chrome, some functionality may be missing in other browsers. For the time being, the volume control has not been setup properly and isn't working (this will be fixed shortly).
* `stop_web_ui` - this command will kill the `nodejs` instance and the Web UI will not longer be visible in a web browser.
* `restart_web_ui` - this command will kill the `nodejs` instance then restart `nodejs` in the same manner as `start_web_ui`, this command is essentially a combination of both `start_web_ui` and `stop_web_ui`. `restart_web_ui` is used mainly to refresh the sinks. This refreshing of sinks will be shortly available as a button inside the Web UI.




![Web UI Controls](https://raw.githubusercontent.com/BaReinhard/Multiroom-Audio-iOS/master/node/public/app/img/multiroomaudio.png)
Thats it! Enjoy.
