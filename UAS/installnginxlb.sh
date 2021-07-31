echo 'Starting Provision: lb1'
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx stop
sudo rm -rf /etc/nginx/sites-enabled/default
sudo nano /etc/nginx/sites-enabled/default
echo "upstream testapp {
        server 10.11.11.31;
        server 10.11.11.32;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                proxy_pass http://testapp;
        }

}" >> /etc/nginx/sites-enabled/default
sudo service nginx start
echo "Machine: lb1" >> /usr/share/nginx/html/index.html
echo 'Provision lb1 complete'