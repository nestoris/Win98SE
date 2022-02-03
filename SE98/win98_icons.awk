#!/usr/bin/awk -f
BEGIN{
postfix="_win98"
finder="find . -name \"*"postfix".png\""
while((finder|getline)>0){
basename=name2k=name98=$0
gsub(postfix,"_win98",name98)
gsub(postfix,"_win2k",name2k)
gsub("_win98","",basename)
#print basename, name98, name2k
print install="ln -f " name98 " " basename
system(install)
close(install)
}
close(finder)
upd="/usr/bin/gtk-update-icon-cache ."
system(upd)
close(upd)
}

