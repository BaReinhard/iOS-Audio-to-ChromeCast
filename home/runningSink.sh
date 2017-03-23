#!/bin/bash
#should be placed in home directory for the user being used
pactl list sinks | grep -E 'Sink|State' | sed 's/.*#//' | sed 's/.*: //' | tac | sed -e ':a' -e 'N' -e '17677ba' -e 's/\n/ /g' | xargs ./grabSink.sh

