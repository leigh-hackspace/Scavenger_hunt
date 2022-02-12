#! /bin/bash

#read -p "Enter Desired Database Name: " dbName
#read -p "Enter Desired Username: " dbUser
#read -p "Enter Desired Password: " dbPass

#echo "Database name: $dbName"
#echo "Username: " $dbUser
#echo "Password: " $dbPass


#echo "## Scavenger Hunt Config" >> ~/.bashrc
#echo "" >> ~/.bashrc
#echo "export SCAVENGER_DB_NAME='$dbName'" >> ~/.bashrc
#echo "export SCAVENGER_DB_USER='$dbUser'" >> ~/.bashrc
#echo "export SCAVENGER_DB_PASS='$dbPass'" >> ~/.bashrc

#source ~/.bashrc

echo $SCAVENGER_DB_NAME
echo $SCAVENGER_DB_USER
echo $SCAVENGER_DB_PASS

set -e

sudo su postgres <<EOF
psql -c "CREATE USER 'hunt_admin; WITH ENCRYPTED PASSWORD 'Y3llowhat';"
CREATE DATABASE $dbName owner 'hunt_admin';
psql -c "grant all privileges on database 'egg_hunt' to 'hunt_admin';"
echo "Postgres User 'hunt_admin' and database 'egg_hunt' created."
EOF
