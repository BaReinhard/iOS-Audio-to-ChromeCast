#!/bin/bash
while [ $# -gt 0 ]
do
if [ $1 = "RUNNING" ];
then
    echo $2
fi
shift
done
