#!/bin/bash
#
# Move photo to the year folder by name
#
# Usage:
#   ./move-by-year.sh
#
#############################################################

# mv IMG_2014* 2014
# mv IMG_2015* 2015
# mv IMG_2016* 2016
# mv IMG_2017* 2017
# mv IMG_2018* 2018
# mv IMG_2019* 2019
# mv IMG_2020* 2020


# rsync -avhPnm --size-only --stats ~/Honor/Photo/2020/ ./Photo/2020
# rsync -avhPnm --size-only --stats ~/Honor/Photo/2020/ ./Photo/2020
# rsync -avhPnm --size-only --stats ~/Honor/Photo/2020/ ./Photo/2020
# rsync -avhPnm --size-only --stats ~/Honor/Photo/ ./Photo

current_dir=`dirname $0`
name_file=$current_dir/names.txt

from=/Volumes/lee/SeagateDashboard/lyj289@163.com/FRD-AL00_WiFi/Photos/DCIM/Camera/
from=~/Honor/Photo/
to=/Volumes/lee/Honor/Photo
rsync -avhPn --size-only --stats \
  --exclude-from=$name_file \
  $from $to