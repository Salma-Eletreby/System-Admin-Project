#!/bin/bash

#creates the file if it doesn't exist
touch /Project/Files/bigfile
#clears the file if its not empty
> /Project/Files/bigfile

sudo apt install bsd-mailx #install of email server
sudo apt install mutt #for attatchement

#searches for files larger than 1 MB and stores the result in bigfile
find /home/$USER/ -type f -size +1M > /Project/Files/bigfile

#counts the number of lines in the file
WORD=$(wc -l < /Project/Files/bigfile)

#sends an eamil with the contents of the files
#replace it with your own email while testing
if [[ "$(wc -c < /Project/Files/bigfile)"-eq"0" ]]; then
  #adds the count to the end of the file
  echo >> /Project/Files/bigfile
  echo "Number of files: $WORD" >> /Project/Files/bigfile
  echo "Date the files were found: $(date +"%d-%b-%Y")" >> /Project/Files/bigfile

  more /Project/Files/bigfile| mutt -a  /Project/Files/bigfile -s "Files bigger than 1M on $USER system" -- se2005204@qu.edu.qa
fi
