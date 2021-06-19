#!/bin/bash

for i in `find . -type l`
do 
	newfile=`echo $i|sed 'p;s/\.png/\.svg/'|grep "\.svg"` 
	target=`ls -l $i|awk '{print $11}'|sed 'p;s/\.png/\.svg/'|grep "\.svg"`
	echo "I: $i"
	echo "Newfile: $newfile"
	echo "Target: $target"
	echo \n
#        ln -s $target $newfile
#       	rm $i
done
