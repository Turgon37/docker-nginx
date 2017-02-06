#!/bin/sh

if [[ ! -f /etc/nginx/ssl/dh2048.pem ]]; then
  echo "Creating Diffie-Hellman group (can take several minutes...)"
  openssl dhparam -out /etc/nginx/ssl/dh2048.pem.tmp 2048
  mv /etc/nginx/ssl/dh2048.pem.tmp /etc/nginx/ssl/dh2048.pem
fi

nginx -g "daemon off;"
