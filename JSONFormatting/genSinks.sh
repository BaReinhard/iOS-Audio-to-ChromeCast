#!/bin/bash

pactl list sinks | grep -E 'Sink|Name|Volume: front-left' | sed 's/.*,//' | sed 's/%.*//' | sed 's/.*\ //' | sed 's/.*#//' | sed 's/.*: //' | xargs /usr/local/bin/jsonString.sh
