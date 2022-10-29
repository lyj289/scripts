#!/bin/bash
#
# Move photo to the year folder by name
#
# Usage:
#   ./move-by-year.sh
#
#############################################################

# cat ~/2018.log | while read line; do
#   file=/Volumes/lee/Honor/Photo/2018/${line/.jpg/_1.jpg}
#   if [[ -e $file ]]; then
#     rm /Volumes/lee/SeagateDashboard/lyj289@163.com/FRD-AL00_WiFi/Photos/DCIM/Camera/$line
#     echo $line
#   fi
# done


cat ~/2018.log | while read line; do
  from=/Volumes/lee/SeagateDashboard/lyj289@163.com/FRD-AL00_WiFi/Photos/DCIM/Camera/$line
  if [[ -e $from ]]; then
    mv $from /Volumes/lee/Honor/Photo/diff
  fi
done