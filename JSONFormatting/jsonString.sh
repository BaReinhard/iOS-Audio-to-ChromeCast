#!/bin/bash
counter=0
base=1
sinkCounter=0
parameters=$#
numParameters=$((parameters/3))

echo [

while [ $# -gt 0 ]
do

        id=$1
        value=$3
        echo "{ \"sink\" : \"$1\","
        shift
        echo "\"name\" : \"$1\","
        shift
        echo "\"volume\" : \"$1\","
        shift
        echo "\"value\" : \"$value\","
        echo "\"options\" : {"
        echo "\"id\" : \"$id\","
        echo "\"floor\" : \"0\","
        echo "\"ceil\" : \"100\","
        echo "\"onChange\" : \"function(id, value){updateVol(id,value);}\"}"

        if [ $# = 0 ]
        then
                echo "}"
        else
                echo "},"
        fi
done

echo ]
