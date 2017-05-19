#!/bin/bash
counter=0
base=1
sinkCounter=0
parameters=$#
echo [

while [ $# -gt 0 ]
 if [ $1 == *"RUNNING"* ]
    echo $1 | sed 's/RUNNING //' | echo
    
 fi
do
