#!/bin/bash
#
# For sync mobile phone to u, after install termux to start ssh in mobile
#
# Usage:
#   ./sync-photo-from-mobile-to-u.sh [test file size in MBs]
#
#############################################################

me=home
phone=/Volumes/LEE2/Backup/Honor

from_camera="$me:~/storage/dcim/Camera/"
to_photo=$phone/Photo
to_video=$phone/Video/

from_weinxin="$me:~/storage/shared/tencent/MicroMsg/WeiXin/"
to_weixin_photo=$phone/WeiXin/Photo
to_weixin_video=$phone/WeiXin/Video

# -m ignore empty folder
# -n --dry-run
# -v --verbose
# -h for human readble
# -vv show more filter deatil info
# -u --update
# -stats give some file-transfer stats

options="-avhPm --size-only --stats "
# options="-avhPnm --size-only --stats " # dry-run

echo "------------- Rsync Photo ----------------"

# For u pan
rsync ${options} --include="*.jpg" --exclude="*" $from_camera $to_photo

echo ""

echo "------------- Rsync Photo Video ----------------"
rsync ${options} --include="*.mp4" --include="*/" --exclude="*" $from_camera $to_video
echo ""

echo "------------- Rsync Weixin Video ----------------"
rsync ${options} --include="*.mp4" --include="*/" --exclude="*" $from_weinxin $to_weixin_video
echo ""

echo "------------- Rsync Weixin Photo ----------------"
rsync ${options} --include="*.jpg" --include="*/" --exclude="*" $from_weinxin $to_weixin_photo
echo ""


