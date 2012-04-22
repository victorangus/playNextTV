#!/bin/sh

#播放器
player="vlc"

#高畫質
high="http://nextmedia-f.akamaihd.net/nexttvlive_1_600@49187"

#低畫質
low="http://nextmedia-f.akamaihd.net/nexttvlive_1_300@49187"

#預設畫質
quality=$high

#檢查環境
if ! which $player > /dev/null; then
    zenity --error --text="$player還沒安裝"
    exit
elif ! which curl > /dev/null; then
    zenity --error --text="curl還沒安裝"
    exit
fi

zenity --question --text="高畫質播放？"
if [ $? -ne 0 ] ; then
    quality=$low
fi

curl $quality | $player -
exit 0
