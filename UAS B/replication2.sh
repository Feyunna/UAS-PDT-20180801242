#!/bin/bash

sudo apt update
sudo apt install postgresql postgresql-contrib -y

sudo systemctl stop postgresql

sudo mv /var/lib/postgresql/10/main /var/lib/postgresql/10/main_old

##sudo -u postgres pg_basebackup -h 10.11.11.31 -D /var/lib/postgresql/10/main -U replicationuser -v -P --wal-method=stream



sudo sed -i 's/#hot_standby = on/hot_standby = on/' /etc/postgresql/10/main/postgresql.conf

sudo cp -avr /usr/share/postgresql/10/recovery.conf.sample /var/lib/postgresql/10/main/recovery.conf


sudo sed -i 's/#standby_mode = off/standby_mode = on/' /var/lib/postgresql/10/main/recovery.conf

# sudo sed -i 's/#primary_conninfo = ''/primary_conninfo = 'host=10.11.12.51 port=5432 user=replicationuser password=admin'/' /var/lib/postgresql/9.5/main/recovery.conf


sudo systemctl start postgresql
