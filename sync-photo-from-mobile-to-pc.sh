#!/bin/bash
#
# For sync mobile phone to pc, after install termux to start ssh in mobile
#
# Usage:
#   ./sync-photo-from-mobile-to-pc.sh [test file size in MBs]
#
#############################################################

from_camera="home:~/storage/dcim/Camera/"
to_photo=~/Honor/Photo/
to_video=~/Honor/Video/

from_weinxin="home:~/storage/shared/tencent/MicroMsg/WeiXin/"
to_weixin_photo=~/Honor/WeiXin/Photo
to_weixin_video=~/Honor/WeiXin/Video


from_voice="home:~/storage/shared/WXVExporter/"
to_voice=~/Honor/mp3

# -m ignore empty folder
# -n --dry-run
# -v --verbose
# -h for human readble
# -u --update
# -stats give some file-transfer stats

options="-avhPm --size-only --stats "
# options="-avhPnm --size-only --stats " # dry-run
# options="-avhPnm --size-only " # dry-run

echo "------------- Rsync Photo ----------------"
rsync ${options} --include="*.jpg" --include="*/" --exclude="*" $from_camera $to_photo
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

# echo "------------- Rsync Voice ----------------"
# rsync ${options} --include="*.mp3" --include="*/" --exclude="*" $from_voice $to_voice
# echo ""

# https://rsync.samba.org/examples.html#Fancy footwork with remote file lists
# echo "------------- Rsync Origin Voice ----------------"
# rsync -avn -vvvv cz:'$(find ./storage/shared/tencent/MicroMsg/38839c59ad0ae63824b0c9374af756bf/voice2/ -name "*.amr" -size +60k)' ~/Honor/voice

# converter amr to mp3, with silk-v3-decoder from github
# sh converter.sh ~/Honor/voice ~/Honor/voice-mp3 mp3