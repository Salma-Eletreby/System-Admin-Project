# System-Admin-Project
A group project using Ubuntu's Shell Script for Operating Systems Lab (CMPS 405) that entails some system administration

## Overview
These scripts are designed for monitoring system activity and performance on Ubuntu 22.04. The set of scripts logs user activity and captures crucial system information over time.

---

## Scripts Overview

### Main.sh
The primary script, `Main.sh`, verifies user credentials and executes subroutines based on user privileges. It manages invalid login attempts, user access, and system reboots in case of unauthorized access.

### Display.sh
The `Display.sh` script provides essential system information.

### Network.sh
`Network.sh` gathers network configuration, routing table, hostname, tests local DNS server, traces route to `google.com`, and pings `google.com`. Information is logged in `network.log`.

### System.sh
`System.sh` displays detailed disk information for the HOME directory, including disk space, usage, memory, CPU model, and core count. Results are saved in `disk_info.log` and `mem_cpu_info.log`.

### Check.sh
The `Check.sh` script identifies files with permission `777`, displays them, and changes their permissions to `700`. Log details are stored in `perm_change.log`.

### Install.sh
`Install.sh` manages the installation of MySQL, system updates, and reload messages. Errors are logged in `Installation.log`.

### Search.sh
`Search.sh` finds files larger than 1M, logs the search date, and emails the system administrator (`my student email`) about the results in the `bigfile`.

## Directory
It is assumed that the scripts are stored in these paths. (the files will be stored with their respective script and files are organised as such)
![image](https://github.com/Salma-Eletreby/System-Admin-Project/assets/142803990/81d5dbf3-652a-4bb0-a7cd-b31428ceb0ce)

