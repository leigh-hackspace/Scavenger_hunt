#! /bin/bash

read -p "Enter Desired Database Name: " dbName
read -p "Enter Desired Username: " dbUser
read -p "Enter Desired Password: " dbPass


echo "## DEV" >> .env
echo "SCAVENGER_DB_NAME="$dbName >> .env
echo "SCAVENGER_DB_USER="$dbUser >> .env
echo "SCAVENGER_DB_PASS="$dbPass >> .env
echo "" >> .env

set -e

sudo su postgres <<EOF
psql -c "CREATE USER $dbUser WITH PASSWORD '$dbPass';"
psql -c "CREATE DATABASE $dbName owner $dbUser;"
psql -c "grant all privileges on database $dbName to $dbUser;"
echo "Postgres User $dbUser and database $dbName created."

EOF