#!/bin/bash
#creates the file if doesn't exist
touch /Project/Files/Installation.log
#clears the file if it exists
> /Project/Files/Installation.log
#installs sql - any error than occurs is redirected to the file
sudo apt-get install mysql-server 2>> /Project/Files/Installation.log

echo -e "\nSQL version: "
mysql --version #for checking it is installed

sudo systemctl restart mysql 2>> /Project/Files/Installation.log  #to restart MySQL

echo -e "\nSQL Status: "
sudo systemctl status mysql | grep "Active\|Status" #for checking succesful restart

sudo apt update 2>> /Project/Files/Installation.log #updates the system

echo -e "\nSystem will be reloaded..."
shutdown -r
