#!/bin/bash
#20.08.2021 23:59:15 Generated by lincentrator
filhere="../../../../../../icons/SE98/places/48/network-workgroup.png"
fil="$(realpath -s "$filhere")" #было /home/joker/Документы/icons/SE98/places/48/network-workgroup.png
filr="$(realpath "$filhere")" #было /home/joker/Документы/GitHub/Win98SE/Icons/SE98/places/48/network-workgroup.png
cmd="md5sum"
if [ -h "$fil" ];then
 unlink "$filhere"
 cp -f "$filr" "$filhere"
fi
filsum=$($cmd "$filr"|sed 's/ .*//g') #было 2e5390150c0b9023424bcaf775cef28c
$cmd ./* 2>/dev/null|grep $filsum|grep -Gv "/../../../../../../icons/SE98/places/48/network-workgroup.png"$|sed -e 's/^[^ ]* *//g'|while read line; do
ln -srf "$filhere" "$line"
done