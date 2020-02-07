#!/bin/bash
# update_photo_time.sh
#
# Update photo create time by diff photo name and mtime
#
# Usage:
#   ./update-photo-time.sh
#
#############################################################

log_file=~/diff.log
photo_dir=~/dcim/Photo/*.jpg

# Empty log
echo "" > $log_file

for i in $photo_dir; do
  # 获取照片名称
  name=`basename $i`
  # 获取照片名称中的时间，精确至日
  name_time=${name:4:8}
  # 获取照片属性中的最后修改时间
  m_time=`date -r $(stat -f "%m" $i) +"%Y%m%d"`  # for mac
  # m_time=`date --date="@$(stat -c "%Y" $i)" +"%Y%m%d"`  # for linux
  # 如果最后修改时间和照片名称中的时间不是同一天，进行批量更新
  if [[ "$name_time" != "$m_time" ]]; then
    # 根据照片名称时间组织实际时间参数
    rtime=${name:4:8}${name:13:4}
    # 更新照片时间属性
    touch -t $rtime $i
    echo "$i--$name_time--$m_time" >> $log_file
  fi
done
