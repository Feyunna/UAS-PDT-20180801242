#!/bin/bash

echo 'Starting Provision: web 2'
sudo apt-get update
sudo apt-get install -y nginx
echo "Machine: web"2 >> /usr/share/nginx/html/index.html
echo 'Provision web'2 'complete'