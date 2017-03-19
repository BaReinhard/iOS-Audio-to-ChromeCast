## How to use the tools inside this folder:


```
/home/{USERNAME}/genSinks.sh > /home/{USERNAME}/projects/node/public/app/sinks.json
tac /home/{USERNAME}/projects/node/public/app/sinks.json | sed '2 s/,$//' | tac > /home/{USERNAME}/projects/node/public/app/sinks.json.new
mv /home/{USERNAME}/projects/node/public/app/sinks.{json.new,json}
```

## Sample Output:


```
[
{       "sink":"0",
        "name":"alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo"},
{       "sink":"1",
        "name":"alsa_output.platform-soc_sound.analog-stereo"},
{       "sink":"2",
        "name":"alsa_output.0.analog-stereo"},
{       "sink":"3",
        "name":"bkklivingroom_chromecast"},
{       "sink":"4",
        "name":"homegroup_chromecast"}
]


```
