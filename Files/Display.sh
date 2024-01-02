#!/bin/bash
echo -e "*********************************\n"
echo -e "\t$USER is currently logged in to the linux system\n"  #displays current username
date=$(date +"%a %b %d %l:%M:%S %p %:::z %Y") #weekday, date, time, zone,year
lastReboot=$(who -b)  #returns the time of last reboot
echo -e  "\tThe current date on the linux system $date\n"
echo -e  "$lastReboot\n"
path=$(pwd) #current path
number=$(ls $HOME | wc -l)  #uses output of ls as input for wc to count the files
echo -e  "\tThe current working path is $path\n"
echo -e  "\tThe curren shell is $SHELL\n"
echo -e  "\tMy Home Directory is $HOME with # of files and Directories in my home =$number\n"
echo -e  "\tThe purpose of this script is to display important information such as username, reboot time, etc\n"
echo "***************************************"
