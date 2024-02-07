#!/bin/sh

sleep 10


#edit the server configuration file
echo "server {
    listen 80;
    location / {
        root $PUBLIC_DIR;
    }
    location /.well-known/acme-challenge/ {
        root $LETS_ENCRYPT_DIR;
    }
}" > /config/default.conf

#reload configuration
echo "reload" > cmd/exec.txt

sleep 20

#close server
echo "close" > cmd/exec.txt