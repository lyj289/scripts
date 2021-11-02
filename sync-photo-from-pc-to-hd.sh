#!/bin/bash
#
# For sync pc to hd, after install termux to start ssh in mobile
#
# Usage:
#   ./sync-photo-from-pc-to-hd.sh
#
#############################################################
dry_run=$1

from=~/Honor
to=/Volumes/lee/Honor

# -m ignore empty folder
# -n --dry-run
# -v --verbose
# -h for human readble
# -u --update
# -stats give some file-transfer stats

# options="-avhPm --size-only --stats "

if [ "${dry_run}" == "run" ]; then
  options="-avhPm --size-only --stats "
else
  echo "dry run"
  options="-avhPnm --size-only --stats " # dry-run
fi

echo "------------- Rsync Weixin Photo ----------------"

rsync ${options} --include="*.jpg" --include="*" --exclude="*"  ${from}/WeiXin/Photo/ ${to}/Weixin/Photo

echo "\n"

echo "------------- Rsync Weixin Video ----------------"

rsync ${options} --include="*.mp4" --exclude="*" ${from}/WeiXin/Video/ ${to}/Weixin/Video

echo "\n"

echo "------------- Rsync Photo ----------------"

rsync ${options} --include="*.jpg" --exclude="*" ${from}/Photo/2021/ ${to}/Photo/2021

echo "\n"

echo "------------- Rsync Video ----------------"

rsync ${options} --include="*.mp4" --exclude="*" ${from}/Video/ ${to}/Video

echo "\n"


echo "------------- Rsync Voice ----------------"

rsync ${options} ${from}/mp3/ ${to}/mp3
rsync ${options} ${from}/Recordings/ ${to}/Recordings

echo "\n"
