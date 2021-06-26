#!/bin/bash
#26.06.2021 18:43:32 Generated by lincentrator
filhere="drive-optical.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/drive-optical.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/drive-optical.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было b7b08522b91934c8e29af00847cc5371
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/drive-optical.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:44:55 Added by lincentrator
filhere="drive-optical.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/drive-optical.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/drive-optical.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было b7b08522b91934c8e29af00847cc5371
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/drive-optical.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:45:15 Added by lincentrator
filhere="computer.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/computer.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/computer.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 5a0048ac90bad1b51cadc3b430eb5c70
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/computer.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:45:29 Added by lincentrator
filhere="video-display.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/video-display.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/video-display.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было e55e2a624ae8aa026f99bcd69c0860ff
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/video-display.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:45:41 Added by lincentrator
filhere="scanner.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/scanner.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/scanner.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было bdeb3b23e4666db8bb1cac5a03e80ca0
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/scanner.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:46:20 Added by lincentrator
filhere="modem.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/modem.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/modem.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 133edad0c89c7c44561fb7d06ec6653f
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/modem.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:46:32 Added by lincentrator
filhere="input-mouse.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-mouse.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-mouse.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было a12b504b67edeb83ec9f75c7fede0cde
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/input-mouse.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:47:14 Added by lincentrator
filhere="input-gaming.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-gaming.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-gaming.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 0ef73bde817d0de57f1c7c212700042b
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/input-gaming.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:47:17 Added by lincentrator
filhere="input-keyboard.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-keyboard.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-keyboard.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 2992a68c434a9b8d36cf862336e7328b
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/input-keyboard.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:47:21 Added by lincentrator
filhere="input-tablet.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-tablet.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/input-tablet.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 813ddcd1c1d2207562f9281c2a8a0e9f
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/input-tablet.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:48:05 Added by lincentrator
filhere="printer.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/printer.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/printer.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 673a6f35822a3d5d2f715bdce682960e
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/printer.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:48:23 Added by lincentrator
filhere="drive-harddisk.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/drive-harddisk.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/drive-harddisk.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было eec0ea7405e7c4cc15804e38f81acf25
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/drive-harddisk.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:49:19 Added by lincentrator
filhere="phone.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/phone.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/phone.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 23453e1691dccb2e19a8565655512f76
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/phone.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:49:32 Added by lincentrator
filhere="audio-input-microphone.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/audio-input-microphone.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/audio-input-microphone.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было d271b1e7d633858e4c3b128516b40fd5
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/audio-input-microphone.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:49:41 Added by lincentrator
filhere="battery.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/battery.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/battery.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 0573cd71beb8cd4351b931520432f4d2
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/battery.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:49:50 Added by lincentrator
filhere="camera-photo.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/camera-photo.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/camera-photo.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 61717135e28dac0e62405b2de8b914d3
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/camera-photo.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:50:00 Added by lincentrator
filhere="camera-video.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/camera-video.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/camera-video.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 020965828f299e23b799e8c056c6c818
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/camera-video.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done

#26.06.2021 18:50:11 Added by lincentrator
filhere="camera-web.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/camera-web.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/devices/48/camera-web.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 8b17d99612494a536ef39fc399552214
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/camera-web.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done
