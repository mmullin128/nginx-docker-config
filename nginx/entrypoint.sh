#!/bin/bash

#inital server configuration
echo "server {
    listen 80;
    location / {
        root $PUBLIC_DIR;
    }
    location /.well-known/acme-challenge/ {
        root $LETS_ENCRYPT_DIR;
    }
}" > /etc/nginx/conf.d/default.conf

#temporary server html
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    This is the default html
</body>
</html>" > $PUBLIC_DIR/index.html


echo "$CONTINUE" > /cmd/exec.txt

CLOSE="close"
CONTINUE="continue"
RELOAD="reload"
SLEEP="sleep"



CMD=$CONTINUE


nginx


while [ "$CMD" != "$CLOSE" ];
do
    if [ -e /cmd/exec.txt ]
    then
        CMD=$(< /cmd/exec.txt)
        echo $CMD
        if [ "$CMD" == "$RELOAD" ]
        then
            nginx -s reload
            echo "" > /cmd/exec.txt
        fi
        if [ "$CMD" == "$SLEEP" ]
        then
            #sleep for 6 hours
            sleep 21600 
        fi
    fi
    sleep 3
done
