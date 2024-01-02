#!/bin/bash

#creating newtork.log file to be save info in
touch /Project/Files/network.log

#Checking if network tools are installed to install them if not
#it checks that by seeing if the command exists or not
type -P route &>/dev/null
if [[ "$?" -eq "1" ]]; then
  sudo apt install net-tools
fi

type -P traceroute &>/dev/null
if [[ "$?" -eq "1" ]]; then
  sudo apt install traceroute
fi

#start of the code
echo -e "\n"
#clears the files content if it has anything in it
> /Project/Files/network.log

# Displaying network configuration information and overwrting info in file as its the start of script
# we use tee to send to both the terminal and file all at once
ifconfig | tee /Project/Files/network.log

# Displaying hostname and adding that part to end of file
echo "HOSTNAME $(hostname)" | tee -a /Project/Files/network.log
echo -e "\n"

#Testing local DNS server and adding that part to end of file
echo "Test DNS Server:"
nslookup google.com | tee -a /Project/Files/network.log

# Displaying routing table using the numeric form and adding that part to end of file
route -n | tee -a /Project/Files/network.log
echo -e "\n"

#Pinging google and adding that part to end of file
ping -c 5 google.com | tee -a /Project/Files/network.log
echo -e "\n"

# Tracing route to Google and adding that part to end of file
echo "Tracing the Route to GOOGLE.COM"
traceroute Google.com | tee -a /Project/Files/network.log
