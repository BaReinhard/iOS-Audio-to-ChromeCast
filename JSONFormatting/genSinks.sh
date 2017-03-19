#!/bin/bash

pactl list sinks | grep -E 'Sink|Name' | sed 's/.*#//' | sed 's/.*: //'| xargs /home/brett/jsonString.sh
