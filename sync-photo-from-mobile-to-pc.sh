#!/bin/bash
#
# For sync mobile phone to pc, after install termux to start ssh in mobile
#
# Usage:
#   ./sync-photo-from-mobile-to-pc.sh [test file size in MBs]
#
#############################################################

dry_run=$1

me=home
phone=Honor

# me=chang
# phone=Oppo


from_camera="$me:~/storage/dcim/Camera/"
to_photo=~/$phone/Photo
to_video=~/$phone/Video/


from_camera_albums="$me:~/storage/dcim/MyAlbums/"
to_photo_albums=~/$phone/MyAlbums

# from_weixin="$me:~/storage/shared/tencent/MicroMsg/WeiXin/"
from_weixin_old="$me:~/storage/shared/tencent/MicroMsg/WeiXinOld/"
to_weixin_old=~/$phone/WeiXinOld

# Start from 230617 WeChat folder is used, while before is Weixin in pictures,
# before 202006 the tencent/MicroMsg/Weixin
from_weixin="$me:~/storage/pictures/WeiXin/"
from_wechat="$me:~/storage/pictures/WeChat/" # latest
to_weixin_photo=~/$phone/WeiXin/Photo
to_weixin_video=~/$phone/WeiXin/Video


from_voice="$me:~/storage/shared/WXVExporter/"
to_voice=~/Honor/mp3


from_recording=$me:"'~/storage/music/Recordings/Standard\\ Recordings'"
to_recording=~/Honor/Recordings

# -m ignore empty folder
# -n --dry-run
# -v --verbose
# -h for human readble
# -vv show more filter deatil info
# -u --update
# -stats give some file-transfer stats

if [ "${dry_run}" == "run" ]; then
  options="-avhPm --size-only --stats "
else
  echo "dry run"
  options="-avhPnm --size-only --stats " # dry-run
fi

echo "------------- Rsync Photo ----------------"

# Use compare
# Notice: As the real create time with the time of file attributes info is different
# of some photos in 2017 year, it will raise some error, which cause a wrong stat file number
# rsync ${options} --compare-dest=$to_photo/2017 --compare-dest=$to_photo/2018 --compare-dest=$to_photo/2019 --compare-dest=$to_photo/2020 --include="*.jpg" --exclude="*" --exclude-from="/Users/liyujian/github/lyj289/scripts/names.txt" $from_camera $to_photo

# Use exclude file
# current_dir=`dirname $0`
# name_file=$current_dir/names.txt

# rsync -ahuPnm --size-only --stats \
#   --exclude-from=$name_file \
#   --include="IMG_2020*.jpg" \
#   --exclude="*" \
#   home:~/storage/dcim/Camera/ ~/Honor/Photo

# Use find grep
rsync ${options} \
  $me:'$(find ./storage/dcim/Camera/ -name "IMG2024*.jpg" -mtime -365)' ~/Honor/Photo/2024

# For u pan
# rsync ${options} --include="*.jpg" --exclude="*" $from_camera $to_photo

echo "\n"

echo "------------- Rsync Albums Photo ----------------"
# Delete the hidden trashed file
# fd -H trashed ./ -X rm
rsync -r ${options} $from_camera_albums $to_photo_albums
echo "\n"

echo "------------- Rsync Photo Video ----------------"
rsync ${options} --include="*.mp4" --include="*/" --exclude="*" $from_camera $to_video
echo "\n"

# echo "------------- Rsync Weixin old Photo Video ----------------"
# rsync -r ${options} $from_weixin_old $to_weixin_old
# echo "\n"

echo "------------- Rsync Screenshots ----------------"
# after 202208 pictures/Screenshots is used, before is dcim/Screenshots
rsync ${options} --include="*.jpg" $me:~/storage/pictures/Screenshots ~/$phone/
# rsync ${options} --include="*.jpg" $me:~/storage/dcim/Screenshots ~/$phone/

echo "------------- Rsync Weixin Video ----------------"
# echo '--weixin\n'
# rsync ${options} --include="*.mp4" --include="*/" --exclude="*" $from_weixin $to_weixin_video
echo '--wechat video \n'
rsync ${options} --include="*.mp4" --include="*/" --exclude="*" $from_wechat $to_weixin_video
echo "\n"

echo "------------- Rsync Weixin Photo ----------------"
# echo '--weixin\n'
# rsync ${options} --include="*.jpg" --include="*/" --exclude="*" $from_weixin $to_weixin_photo
echo '--wechat photo \n'
rsync ${options} --include="*.jpg" --include="*/" --exclude="*" $from_wechat $to_weixin_photo
echo "\n"

# echo "------------- Rsync Voice ----------------"
# rsync ${options} --include="*.mp3" --include="*/" --exclude="*" $from_voice $to_voice
# echo "\n"


echo "------------- Rsync Recordings ----------------"
# echo rsync ${options} $from_recording $to_recording
echo "\n"


# find the trashed files and remove
# fd -H trashed ./ -X rm
# fd --hidden --no-ignore '.trashed' -x rm

# https://rsync.samba.org/examples.html#Fancy footwork with remote file lists
# echo "------------- Rsync Origin Voice ----------------"
# rsync -avn -vvvv cz:'$(find ./storage/shared/tencent/MicroMsg/38839c59ad0ae63824b0c9374af756bf/voice2/ -name "*.amr" -size +60k)' ~/Honor/voice

# converter amr to mp3, with silk-v3-decoder from github
# sh converter.sh ~/Honor/voice ~/Honor/voice-mp3 mp3
#


# Add exclude file
# rsync -avhPnm $(fd 2015 ./Camera) ~/Honor/2015

# rsync -avhPnm --size-only --stats --include="*.jpg" --compare-dest=./old --exclude="*" ./mock/ ./mock2/

# rsync -avPn --size-only --stats --compare-dest=/Users/liyujian/Honor/2017bak/ /Users/liyujian/Honor/Photo/ /Users/liyujian/Honor/other/

# fd . ./ -x echo '-' > ~/rule.txt
# rsync -avPn --size-only --stats --exclude-from="/Users/liyujian/rule.txt" ./2017/ ./Photo
