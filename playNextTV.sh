#!/bin/sh

player="vlc"

#800bits 640x360
high="tvstreamv1_1@27911"

#400bits 640x360
low="tvstreamv1_2@27911"

url="rtmp://cp93793.live.edgefcs.net/live/"
app="live"
swf="http://www.nexttv.com.tw/tv/nexttv/StrobeMediaPlayback.swf"
page="http://www.nexttv.com.tw/"

if ! which $player > /dev/null; then
	echo "$player還沒安裝"
elif ! which rtmpdump > /dev/null; then
	echo "rtmpdump還沒安裝"
else
	rtmpdump -v -r $url -a $app -W $swf -p $page -y $high | $player -
fi
