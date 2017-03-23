#!/bin/bash

#This should be placed in the home directory for the user being used

#sink=$2
sink=$(~/runningSink.sh)
pactl set-sink-volume $sink $1%




