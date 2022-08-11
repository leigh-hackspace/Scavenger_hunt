#! /bin/bash

read -p "Enter Desired Database Name: " dbName
read -p "Enter Desired Username: " dbUser
read -p "Enter Desired Password: " dbPass
psql -c "CREATE USER $dbUser WITH ENCRYPTED PASSWORD $dbPass;"
psql -c "CREATE DATABASE $dbName owner $dbPass;"
psql -c "grant all privileges on database $dbName to $dbUser;"