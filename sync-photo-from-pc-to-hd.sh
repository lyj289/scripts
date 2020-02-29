#!/bin/bash
#
# For sync mobile phone to pc, after install termux to start ssh in mobile
#
# Usage:
#   ./sync-photo-from-mobile-to-pc.sh [test file size in MBs]
#
#############################################################

from=~/Honor
to=/Volumes/LEE/Backup/Honor

# -m ignore empty folder
# -n --dry-run
# -v --verbose
# -h for human readble
# -u --update
# -stats give some file-transfer stats

options="-avhPm --size-only --stats "
# options="-avhPnm --size-only --stats " # dry-run
options="-avhPnm --size-only --stats " # dry-run

echo "------------- Rsync Weixin Photo----------------"

rsync ${options} --include="*.jpg" --include="*.png" --exclude="*"  ${from}/weixin/Photo/ ${to}/Weixin/Photo

echo "------------- Rsync Weixin Video----------------"

rsync ${options} --include="*.mp4" --exclude="*" ${from}/weixin/Video/ ${to}/Weixin/Video

echo "------------- Rsync Photo ----------------"

rsync ${options} --include="*.jpg" --include="*.png" --exclude="*"  ${from}/Photo/ ${to}/Photo

echo "------------- Rsync Video ----------------"

rsync ${options} --include="*.mp4" --exclude="*" ${from}/Video/ ${to}/Video
