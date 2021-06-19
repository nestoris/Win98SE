#!/bin/bash
START=$(date +%s%N)

if [ -s $1 && ! -z $2 ];then
for i in `find -maxdepth 1 -type d|awk '/^\.\/[0-9].*/{gsub("./","",$0);print}'|sort|xargs`
do
ln -srf "$1" "$2"
done
fi

END=$(date +%s%N)
DIFF=$((($END - $START)/1000000))
echo "Время выполнения: $DIFF мс"
