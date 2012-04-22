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
    echo "$player還沒安裝"
    exit
elif ! which curl > /dev/null; then
    echo "curl還沒安裝"
    exit
fi

#主程式
echo "=================================================================="
echo "     請選擇項目"
echo "=================================================================="
echo
echo "(1)  = 高畫質            (2) = 低畫質                  (3) = 離開"
echo
printf "輸入數字後按<Enter>: "
read Select

case "$Select" in
    # 高畫質
    1)
        quality=$high
    ;;

    # 低畫質
    2)
        quality=$low
    ;;

    # 離開
    3)
        exit
    ;;
    esac

curl $quality | $player -
exit 0
