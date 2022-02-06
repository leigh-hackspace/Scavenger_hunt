#! /bin/bash

read -p "Enter Desired Database Name: " dbName
read -p "Enter Desired Username: " dbUser
read -p "Enter Desired Password: " dbPass

echo "Database name: $dbName"
echo "Username: " $dbUser
echo "Password: " $dbPass


echo "## Scavenger Hunt Config" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export SCAVENGER_DB_NAME='$dbName'" >> ~/.bashrc
echo "export SCAVENGER_DB_USER='$dbUser'" >> ~/.bashrc
echo "export SCAVENGER_DB_PASS='$dbPass'" >> ~/.bashrc

source ~/.bashrc

echo $SCAVENGER_DB_NAME
echo $SCAVENGER_DB_USER
echo $SCAVENGER_DB_PASS

set -e

sudo su postgres <<EOF
createdb  $dbName owner $dbUser;
psql -c "CREATE USER $dbUser WITH ENCRYPTED PASSWORD '$dbPass';"
psql -c "grant all privileges on database $dbName to $dbUser;"
echo "Postgres User '$dbUser' and database '$dbName' created."
EOF

