#!/usr/bin/awk -f
BEGIN{
postfix="_win98"
finder="find . -name \"*"postfix".png\""
while((finder|getline)>0){
basename=tgname=$0
gsub(postfix,"",basename) # removing target postfix from basename
print install="ln -f \"" tgname "\" \"" basename "\"" # hardlinking to win98 name
system(install)
close(install)
}
close(finder)
upd="/usr/bin/gtk-update-icon-cache ."
system(upd)
close(upd)
}

