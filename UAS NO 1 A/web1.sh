#!/bin/bash

echo 'Start Config'
sudo apt-get update
sudo apt-get install -y nginx
echo "ini adalah WEB"1 >> /usr/share/nginx/html/index.html
echo 'Finish Config'