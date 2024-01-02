#!/bin/bash
touch /Project/invalid_attempts.log /Project/unsuccessful_attempts.log

if [[ "$(date +"%d")" -eq "25" ]]; then
  > /Project/unsuccessful_attempts.log
fi

if [[ "$(grep -c "$USER" /Project/invalid_attempts.log )" < "3" ]]; then
  #groups return all the groups the user belongs to
  #we use that as our input for our grep and store it in a var
  exist=$(groups | grep "sudo")

  #if the var is not empty that means the user belongs to sudousers groups
  #if the var is empty that means it was not found aka does not belong
  if [[ -n "$exist" ]]; then
    sudo chmod u+x /Project/Files/* #grants execute privelage for all scripts

    ./Files/Display.sh #displays important user information such as username, system boot time
    ./Files/Network.sh #isntalls netwotk tools and displays network items
    ./Files/System.sh  #displays system info such as disk space
    ./Files/Check.sh #changes permissions of files from 777 to 700
    ./Files/Search.sh #searches for files larger than 1MB and sends the names to the admin
    ./Files/Install.sh #installs sql
  else
    echo "Username: $USER - Time of Attempt: $(date "+%T")" | tee -a /Project/invalid_attempts.log /Project/unsuccessful_attempts.log > /dev/null
    echo "Please ask your administartor to grant you the super user privileges"
  fi
else
  > /Project/invalid_attempts.log
  ./restart.sh
fi
