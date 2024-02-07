#!/bin/bash

nginx

COUNT=0

CLOSE="close"
CONTINUE="continue"
RELOAD="reload"

CMD=$CONTINUE

while [ "$CMD" != "$CLOSE" ];
do
    if [ -e /cmd/exec.txt ]
    then
        CMD=$(< /cmd/exec.txt)
    fi
    echo $CMD
    sleep 5
done
