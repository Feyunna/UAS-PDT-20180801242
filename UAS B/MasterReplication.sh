#!/bin/bash
sudo apt update
sudo apt install postgresql postgresql-contrib -y

sed -i 's/#listen_addresses = "localhost"/listen_addresses = '*'/' /etc/postgresql/10/main/postgresql.conf

sudo systemctl restart postgresql

sudo mkdir -p /var/lib/postgresql/10/main/mnt/server/archivedir

echo "host    replication     replicationuser             10.11.11.32/24                 md5" >> /etc/postgresql/10/main/pg_hba.conf

sed -i 's/#listen_addresses = "localhost"/listen_addresses = '*'/' /etc/postgresql/10/main/postgresql.conf
sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/' /etc/postgresql/10/main/postgresql.conf #insert pake VIM
sed -i 's/#wal_level = replica/wal_level = hot_standby/' /etc/postgresql/10/main/postgresql.conf
sed -i 's/#archive_mode = off/archive_mode = on/' /etc/postgresql/10/main/postgresql.conf
sed -i 's/#max_wal_senders = 10/max_wal_senders=3/' /etc/postgresql/10/main/postgresql.conf

sudo systemctl restart postgresql


#######################
# ADD THIS LATER
# sudo -u postgres createuser -U postgres replicationuser -P -c 5 --replication // Bikin Password = admin
# archive_command = 'test ! -f mnt/server/archivedir/%f && cp %p mnt/server/archivedir/%f'
