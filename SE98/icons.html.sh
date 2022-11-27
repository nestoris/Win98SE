#!/bin/bash
for i in */;do cd $i && printf "$i${i/\//.html}... " && gawk -f ../table_grassmunk > icons.html && echo "done!" && cd ..;done