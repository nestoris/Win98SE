#!/bin/bash
START=$(date +%s%N)

make_orig(){
#Превращение симлинка в физический файл
 if [ -h "$1" ];then
  filr="$(dirname "$1")/$(basename $(readlink "$1"))"
  if [ -f "$filr" ];then
   unlink "$1"
   cp -n "$filr" "$1"
  fi
  targetf=1
 elif [ -f "$1" ]; then
  echo "$1 - orig"
 else
  echo "$1 не найден"
  targetf=0
 fi
}


fname="$(basename "$1")"
fdir="$(dirname "$1")"
vvod="$(basename $(zenity --entry --width=500 --title=Файлы\ с\ таким\ именем\ тут\ и\ в\ соседних\ папках\ будут\ ссылаться\ на:))"
find "$fdir"/.. -maxdepth 2 -name "$fname"|while read line; do
make_orig $(dirname $line)/$vvod
if [ ! $targetf == 0 ]; then ln -srf "`dirname "$line"`/$vvod" "$line"; fi
done


END=$(date +%s%N)
DIFF=$((($END - $START)/1000000))
echo "Время выполнения: $DIFF мс"
