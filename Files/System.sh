#!/bin/bash

# Creating the file for things to be saved in later
touch /Project/Files/mem_cpu_info.log /Project/Files/disk_info.log

#clears the files if necessary
> /Project/Files/mem_cpu_info.log
> /Project/Files/disk_info.log

# Displaying detailed disk information of your HOME directory as shown in screenshot nd overwrting info in file as its the start of script
echo "disk usage for the user's HOME directory"
du -s /home/$USER | tee /Project/Files/disk_info.log

echo "disk file system for root"
df -T / | tee -a /Project/Files/mem_cpu_info.log #Adding that part to end of file

# Displaing free and used memory as well as cpu core
echo "Free Memory"
#outputting column 4 which is free mem
awk '/Mem:/ {print $4}' <(free -m) | tee -a /Project/Files/mem_cpu_info.log  #Adding that part to end of file
echo "Used Memory"
#outputting column 3 which is used mem
awk '/Mem:/ {print $3}' <(free -m) | tee -a /Project/Files/mem_cpu_info.log  #Adding that part to end of file
echo " CPU Model"
#uniq used to output once
grep -m 2 model /proc/cpuinfo | tee -a /Project/Files/mem_cpu_info.log  #Adding that part to end of file
echo "Number of CPU Cores"
grep 'cpu cores' /proc/cpuinfo |uniq | tee -a /Project/Files/mem_cpu_info.log  #Adding that part to end of file
