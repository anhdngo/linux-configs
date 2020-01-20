#!/bin/bash

# Dependencies:
# ffmpeg
# i3lock-color-git

IMAGE=/tmp/i3lock.png
TEXT="Locked"
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
LOCK=$CONFIG/assets/lock.png
RES=$(xrandr --current | grep '*' | uniq | awk '{print $1}')
#This is a bit cheaty
BOXSIZE=$(expr $(echo $RES | cut -d 'x' -f1) / 2)

if [[ $1 != "" ]]; then
    TEXT=$1
fi

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5,drawtext=text=$TEXT:fontcolor='#ffffffe0':fontsize=40:x=(w-tw)/2:y=(h/PHI)+th:shadowcolor='#1d1f21d0':shadowx=2:shadowy=2:box=1:boxcolor=#1a1b22@0.4:boxborderw=$BOXSIZE,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2,eq=brightness=-0.04" -vframes 1 $IMAGE

i3lock -i $IMAGE

rm $IMAGE
