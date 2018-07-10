##!/bin/bash
set -e

### INSTRUCTIONS:

#This script must be run in the PHOTO folder. It will read the date from the
#folder name and the time from the photo filename. It will rename all the pictures to
#the format YYYYMMDDHHMMSS.JPG and the call exiftool command to add the date
#from the filename. 

for D in *
do
   if [ -d "$D" ]
   then
       cd $D
       for f in *.JPG
       do
           #rename files in order to match the pattern YYYYMMDDHHMMSS
           mv "$f" "20${D::-3}$f"
           echo "File $f was renamed to 20${D::-3}$f"
       done
       
       exiftool -overwrite_original "-datetimeoriginal<filename" *.JPG
       cd ..
   fi
done

echo "Files were changed sucessfully"
