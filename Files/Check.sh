#!/bin/bash
log=/Project/Files/perm_change.log
> $log #clears the log file before each use
files=$(find /home/$USER -perm 777 -type f)
if [[ -z "$files" ]]; then #checks if there are files with all priviliges for all
  echo "No files with permission 777"
else
  echo "$files"
  for i in $files; do
    chmod 700 $i
    echo "$i permission changed from 777 to 700 at $(date)" >> $log #saves the changes to the log file
  done
  echo "Files with permission 777 changed to 700. Work logged in perm_change.log" #confirmation for the user
fi
