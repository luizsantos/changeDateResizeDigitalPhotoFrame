#!/bin/bash

# To run: 
# (i) sh changeDateResizeDigitalPhotoFrame.sh or
# (ii) chmod a+x changeDateResizeDigitalPhotoFrame.sh and ./changeDateResizeDigitalPhotoFrame.sh

#variables
convert=0
resize_alert=0;
convert_alert_file=0;
current_date=$(date  +"%Y%m%d_%H%M%S")

#messages
errorG="\tError on use the file name or directory name to change file timestamp"
errorFN="\n\t To file use the format name ????YYYYmmdd?HHMM* i.e IMG_20180220_184533584.jpg"
errorDN="\n\t To directory name must have the format YYYY-mm-dd* i.e 2017-01-14-batizado"

# Verify if there are options
for opt in "$@"
do
 case $opt in
  -r|--resize)
  convert=1
  ;;
  *)
  echo -e $"Valid options: \n\t$0 \n\t or\n\t$0 {-r|--resize}" 
  echo -e "The resize option (-r or --resize), will resize pictures/files to 1024x768 resolution..."
  echo -e "If you don't use any options, files won't be resized!"
  exit 1
 esac
done

# Find files from current directory and subdirectories.
files=$(find . -type f -iname '*.JPG')
for f in ${files}
do
 # Absolute path
 echo $f
 
 # Extract file name only - remove - directories
 name=$(echo -e "$f" | rev | cut -d'/' -f1 | rev)
 
 # If resize options is enable, then resize the file.
 if [ $convert -eq 1 ]; then
    echo "\tResize $f to 1024x768"
    convert $f -resize 1024x768\> $f
    else
    # just a message on the first time!
    if [ $resize_alert -eq 0 ]; then
      echo -e "\nResize is disabled, set $0 -r or --resize to enable it!\n"
      resize_alert=1
    fi
 fi
 
 # Extract date from file names
 #echo -e "File name \t$name"
 d=${name:4:8}
 d+=${name:13:4}
 echo -e "\t Date from file name: $d"

 # Try change timestamp of file from date extracted in file name
 if touch -t $d $f 2> /dev/null;
 then
  echo -e "\t Date changed with file name"
 else 
  dname=$(echo -e "$f" | rev | cut -d'/' -f2 | rev)
  dDir=${dname:0:4}
  dDir+=${dname:5:2}
  dDir+=${dname:8:2}
  dDir+="0000"
  echo -e "\t Date from directory name: $dDir"
  
  # if not possible change timestamp with file name, try to use the directory name
  if touch -t $dDir $f 2> /dev/null;
  then
    echo -e "\t Date changed with directory name"
    
  else
    # Show message erro if wan't possible extract timestamp from a file or directory name, only one time.
    if [ $convert_alert_file -eq 0 ]; then
      echo -e "$errorG $errorFN $errorDN"
      echo -e "$errorG $errorFN $errorDN" >> convertPhotoDateSize_$current_date.log
      convert_alert_file=1
    fi
    # Log file name from log file.
    echo -e "$f" >> convertPhotoDateSize_$current_date.log
    echo -e "\tError to change data from file/directory name"
  fi
fi
done
