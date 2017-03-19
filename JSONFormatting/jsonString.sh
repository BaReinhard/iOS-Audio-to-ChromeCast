#!/bin/bash
counter=0
base=1
sinkCounter=0
echo [
for param in "$@"
do
        counter=$(($counter + $base))
        if [ $((counter%2)) -eq 0 ];
        then
                echo "  \"name\":\"${param}\"},"

                sinkCounter=$(($sinkCounter + $base))
        else
#                echo "Sink${sinkCounter}:["

                echo "{ \"sink\":\"${param}\", "
        fi

done
echo ]
