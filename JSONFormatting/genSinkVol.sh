#!/bin/bash

pactl list sinks | grep -E Volume | grep front-left | sed 's/.*,//' | sed 's/%.*//' | sed 's/.*\/ //' | xargs /home/{USERNAME}/jsonVolume.sh