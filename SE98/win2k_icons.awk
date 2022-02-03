#!/usr/bin/awk -f
BEGIN{
postfix="_win2k"
finder="find . -name \"*"postfix".png\""
while((finder|getline)>0){
basename=name2k=name98=$0
gsub(postfix,"_win98",name98)
gsub(postfix,"_win2k",name2k)
gsub("_win2k","",basename)
#print basename, name98, name2k
print install="ln -f " name2k " " basename
system(install)
close(install)
}
close(finder)
upd="/usr/bin/gtk-update-icon-cache ."
system(upd)
close(upd)
}

