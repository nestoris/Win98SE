#!/usr/bin/gawk -f
function starttime(){ #Выполнить в начале, для использования finishtime() - показать время выполнения скрипта.
cmd = "date +%s%N";
while ((cmd|getline startdate)>0);
close(cmd)}

function finishtime(){
cmd = "date +%s%N";
while ((cmd|getline finishdate)>0);
close(cmd)
diff=(finishdate-startdate)/1000000;
print "Время выполнения: " diff " мс"
}

function sortargs(){
o=0
for(i in ARGV){
if(ARGV[io]~/^-.*/){
o++
opt[o]=ARGV[io]
opt_tmp==ARGV[io]
delete ARGV[io]

if(opt[o] ~ /^-c=/){ #если указаны контексты
opt_tmp=opt[o]
gsub(/^-c=/,"",opt_tmp)
conts=opt_tmp; gsub(","," ",conts) #делаем строку conts с пробелами вместо запятых
split(opt_tmp,conts_input_array,",")
}

if(opt[o] ~ /^-s=/){ #если указаны размеры
opt_tmp=opt[o]
gsub(/^-s=/,"",opt_tmp)
split(opt_tmp,sizes,",")
}

if(opt[o] ~ /^-u=/){ #если указан файл-список
opt_tmp=opt[o]
gsub(/^-u=/,"",opt_tmp)
cmd = "if [[ -f "opt_tmp" ]];then awk -F\"\t\" 'BEGIN{OFS=\"\\t\"};/^$/||/^#/{next};!/ /&&/^[A-Z]/{cont=$1};$1!~/[A-Z]/&&!/^$/{print cont, $1, $2}' " opt_tmp";else echo \"error: Файл '"opt_tmp"' не найден\";fi";
#cmd = "cat " opt_tmp;
while ((cmd|getline linn)>0) #переменная linn -- каждая строка парсинга списка значков, скопированных из http://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html
print linn;
if(linn!~"error: "){exit #если выдалась ошибка, то сразу выйти
}else{
{split(linn,stdi_stdd,"\t"); stdicon_cont[stdi_stdd[2]]=stdi_stdd[1]; stdicon_name[stdi_stdd[2]]=stdi_stdd[2]; stdicon_desc[stdi_stdd[2]]=stdi_stdd[3]}
#stdicon[linn]
std_icon_list=opt_tmp
}
close(cmd)
}}}}


function printHelp(){
print "Скрипт для просмотра и сравнения тем значков GNU/Linux.\n"
print "Синтаксис: " scriptname "[ФАЙЛ1] [ФАЙЛ2]… [ПАРАМЕТР]…"
print "\tФайлы могут быть как с полным путём, так и с относительным. Но всегда - index.theme. Вводятся через пробел перед указанием параметров.\n"
print "Параметры бывают такие:"
print "\t-с\tВыбор контекстов для сравнения. Указывается таким образом: «-c=Actions,MimeTypes»"
print "\t-s\tВыбор размеров значков для обработки. Указывается таким же образом: «-s=16,32,48»"
print "\t-u\tС этим параметром выводятся только значки, указанные в файле-списке. «-u=[ФАЙЛ]». Синтаксис файла:Контекст - одно слово в строке, далее список из строк типа: имя и описание значка, разделённые табуляцией. Строки, содержащие пробелы И заглавные буквы, начинающиеся с решётки, а так же пустые игнорируются"
print "\t-f\tПапка для сохранения html-файлов. «-f=[папка]»."
hlp_print="1"
exit
}


function getpathhere(){
cmd = "realpath $PWD";
while ((cmd|getline pwd)>0);
{gsub(/\n/,"",pwd)};
close(cmd)
}

function getAbsPath(fil){ #Получение абсолютного пути к файлу (без имени)
cmd1 = "realpath " fil "";
while ((cmd1|getline printpath)>0);
{gsub(/[^/]+$/,"",printpath); return printpath}
close(cmd1)
}

function realPath(fil){ #Получение абсолютного пути к файлу (без имени)
cmd2 = "realpath " fil "";
while ((cmd2|getline printpath)>0);
{return printpath}
close(cmd2)
}

function chooseConts(){ #выбор контекстов с помощью Зенити
if(!conts){
if(!conts_bash){conts_bash_f()}
cmd = "zenity --list --width=500 --height=400 --multiple --separator=' ' --text='Выбери контексты темы (Ctrl+click - выбор нескольких)' --title 'Выбор контекстов' --column 'Контекст' "conts_bash" 2>/dev/null"
while ((cmd|getline conts)>0);
close(cmd)
gsub(/\n/,"",conts)
#split(conts,conts_arr," ")
}
print conts
}

function sortopt(i){
o++
print "удалятся: " o". " ARGV[i], " № "i
opt[o]=ARGV[i]
opt_tmp==ARGV[i]
delete ARGV[i]

if(opt[o] ~ /^-c=/){ #если указаны контексты
opt_tmp=opt[o]
gsub(/^-c=/,"",opt_tmp)
conts=opt_tmp; gsub(","," ",conts) #делаем строку conts с пробелами вместо запятых
split(opt_tmp,conts_input_array,",")
}

if(opt[o] ~ /^-s=/){ #если указаны размеры
opt_tmp=opt[o]
gsub(/^-s=/,"",opt_tmp)
split(opt_tmp,sizes,",")
}


if(opt[o] ~ /^-f=/){ #если указана папка
opt_tmp=opt[o]
gsub(/^-f=/,"",opt_tmp)
gsub(/^\x22||\x22$||^'||'$/,"",opt_tmp)
fldr=opt_tmp
}

if(opt[o] ~ /^-u=/){ #если указан файл-список
opt_tmp=opt[o]
#print opt[o],"RRRRRRRRRRRR"
gsub(/^-u=/,"",opt_tmp)
print "Файл со значками и описаниями: \"" opt_tmp"\""
cmd = "if [[ -f "opt_tmp" ]];then awk -F\"\\t\" 'BEGIN{OFS=\"\\t\"};/^$/||/^#/{next};!/ /&&/^[A-Z]/{cont=$1;contnr=NR};NR==contnr+1&&!/\\t/{print cont, $0};$1!~/[A-Z]/&&!/^$/{print cont, $1, $2}' \""opt_tmp"\";else echo \"error: Файл '"opt_tmp"' не найден\";fi"
#print cmd
#cmd = "cat " opt_tmp;
while ((cmd|getline linn)>0){ #переменная linn -- каждая строка парсинга списка значков, скопированных из http://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html
#print linn; #выдаёт таблицу контекст:имя:описание
if(linn~"error: "){exit #если выдалась ошибка, то сразу выйти
}else{
split(linn,linnstr,"\n")

for(l in linnstr){
split(linnstr[l],stdi_stdd,"\t")
if(length(stdi_stdd[3])>0){
stdicon_cont[stdi_stdd[2]]=stdi_stdd[1]
stdicon_name[stdi_stdd[2]]=stdi_stdd[2]
stdicon_desc[stdi_stdd[2]]=stdi_stdd[3]
}else{
stdicon_descont[stdi_stdd[1]]=stdi_stdd[2]
}
}
std_icon_list=opt_tmp
}}
close(cmd)
}
}

function conts_bash_f(){ #разбор аргументов (отделение файлов от опций) и создание переменной conts_bash -- контексты из файлов тем
o=0
for(i in ARGV){
if(ARGV[i]!~/^-.*/&&i>0){ #если аргумент не начинается на минус и не имеет нулевого номера
if(!themesbash){themesbash="\""ARGV[i]"\""}else{themesbash=themesbash " " ARGV[i]}
cmd = "grep -Eoi ^Context=.*$ "themesbash"|cut -d= -f2|sed 's/[\\n\\r]//'|sort -u|xargs" #команда чтения контекстов из файлов тем
#print themesbash
while ((cmd|getline conts_bash)>0);
#gsub(/\n|\r/,"",conts_bash) #удаление переводов строк в конце и создание одной строки с контекстами из файла(ов) тем(ы) (пробел уже есть)
#print conts_bash #Actions Animations Applications Categories Devices Emblems Emotes MimeTypes Places Status Stock Tools
close(cmd)
#print ARGV[i] "DDD"
}else{ #если.аргумент № ноль, или начинается на минус
sortopt(i) #выясняем, что за опция
}
}
}

function makeTable(){ #задать переменные в строке из таблицы
#	sub("]","",$1)
if($1~"Icon Theme"){
	for (i=2; i<=NF; i++){
		if ($i~/^Name=/) {gsub(/^Name=/,"",$i); name=$i; name_arr[FNUM]=$i}
		if ($i~/^Comment=/&&!comment) {gsub(/^Comment=/,"",$i); comment=$i}
		if ($i~/^Example=/) {gsub(/^Example=/,"",$i); example=$i; example_arr[FNUM]=$i}
		if ($i~/^Directories=/) {gsub(/^Directories=/,"",$i); directories=$i}
		if ($i~/^Inherits=/) {gsub(/^Inherits=/,"",$i); inherits=$i}
}
}else{
	for (i=2; i<=NF; i++){
		if ($i~/^MinSize/) {gsub(/^MinSize=/,"",$i); minsize=$i}
		if ($i~/^MaxSize/) {gsub(/^MaxSize=/,"",$i); maxsize=$i}
		if ($i~/^Threshold/) {gsub(/^Threshold=/,"",$i); threshold=$i}
		if ($i~/^Context/) {gsub(/^Context=/,"",$i); context=$i; contexts[context]=context}
		if ($i~/^Type/) {gsub(/^Type=/,"",$i); type=tolower($i); types[type]=type}
		if ($i~/^Scale/) {gsub(/^Scale=/,"",$i); scale=$i; scales[scale]=scale}
		if ($i~/^Size/) {gsub(/^Size=/,"",$i); size=$i; sizes[size]=size}
	}
#if(context&&size){
sizesCont[context][size]=size+0
typesCont[context][type]=type
typesSizesCont[context][type][size]=size+0
sizesType[type][size]=size+0
if(conts&&context){if(conts~context){conts_arr[context]=context}}else{if(context){conts_arr[context]=context}} #массив conts_arr создаётся ЗДЕСЬ на основе введённых контекстов и наличия их в теме
#print context, size, sizesCont[context][size]
#}
}
tabledone=true
}

function printTable(){
		if ($1 ~ /Icon Theme/){
			print "Тема",$1,name,comment,example,dirs,inherits
		}else{
			print "Папка",$1,size,context,type,minsize,maxsize,scale,threshold,"\t"$0
		}
}

function printarr(arr, lin){ #выдать массив в столбик
x=""
if(lin){
for(i in arr){if(!x){parr=arr[i]}else{parr=parr " " arr[i]};x++}
print parr
}
else{for(i in arr){print arr[i]}}
}

function arrline(arr){ #выдать массив в строку
x=""
for(i in arr){if(!x){arrl=arr[i]}else{arrl=arrl " " arr[i]};x++}
return arrl
}

function resetTable(){
size=""
minsize=""
maxsize=""
threshold=""
context=""
type=""
scale=""
}

function testTheme(){ # В ТЕЛЕ ПОСЛЕ makeTable()
if(type=="Scalable"){ext="svg"}else{ext="png"}
if($1!~"Icon Theme"){
	if(context){ # Бывают закомментированные папки. !!!Работаем, если в папке есть контекст!!!
		print "icon[\""context"\"]""[icon]""[\""FNUM"\"]""[\""type"\"]""[\""size"\"]="$1"/icon."ext
	}
}else{
	if(FNUM>1)print ""
	print "Тема №" FNUM
	print "theme["FNUM"][\"name\"]=\""name"\""
	print "theme["FNUM"][\"comment\"]=\""comment"\""
	print "theme["FNUM"][\"example\"]=\""example"\""
	print "theme["FNUM"][\"directories\"]=\""directories"\""
	print "theme["FNUM"][\"inherits\"]=\""inherits"\""
#gsub("[[]","",$0); print $0
}
}

function filesTable_f(){ #Создаёт таблицу всех файлов всех тем в ПЕРЕМЕННУЮ filesTable в виде таблицы имя:контекст:№темы:тип:размер !!!ВЫПОЛНЯЕТСЯ В ТЕЛЕ, ТАК КАК СТРОИТ СПИСОК И ИСПОЛЬЗУЕТ $1!!! ЗАВИСИТ от maketable()
if(tabledone==false){makeTable()} #создаём переменные из параметров для данной строки
{thp=FILENAME;sub(/[^/]+$/, "", thp); cmd = "ls -1 "thp $1 " 2>/dev/null";
while ((cmd|getline result)>0)
if(context){
gsub("\n", ":" context ":" FNUM ":" type ":" size ":" pathToTheme[FNUM] $1 "\n", result)
if(!filesTable){filesTable=result}else{filesTable=filesTable result}}
result=""
close(thp)}
}

function filesLinksTable_f(){ #Создаёт таблицу всех файлов всех тем в ПЕРЕМЕННУЮ filesLinksTable в виде таблицы имя:контекст:№темы:тип:размер !!!ВЫПОЛНЯЕТСЯ В ТЕЛЕ, ТАК КАК СТРОИТ СПИСОК И ИСПОЛЬЗУЕТ $1!!! ЗАВИСИТ от maketable()
if(tabledone==false){makeTable()} #создаём переменные из параметров для данной строки
{thp=FILENAME; pathToFiles=pathToTheme[FNUM] $1; sub(/[^/]+$/, "", thp); cmd = "ls -gGA "thp $1 " 2>/dev/null|awk '$7{printf \"%s\", \""$3":"pathToFiles"\" $7; if($8){printf \"%s\", \": "pathToFiles"$9\"}else{printf \"%s\", \": " pathToFiles " $7\"}; print \":" FNUM ":" size "\"}'";
#print cmd
while ((cmd|getline result)>0)
if(context){
#gsub("\n", ":" context ":" FNUM ":" type ":" size ":" pathToTheme[FNUM] $1 "\n", result)
if(!filesLinksTable){filesLinksTable=result}else{filesLinksTable=filesLinksTable result}}
result=""
close(cmd)}
}

function filesArrays(){
 if($1~/[]]$/){gsub("]","",$1)}
 if(tabledone==false){makeTable()} #создаём переменные из параметров для данной строки
 {thp=FILENAME;sub(/[^/]+$/, "", thp); cmd = "ls -1 "thp $1 " 2>/dev/null";
 while ((cmd|getline result)>0)
 close(cmd)
 }
 #print thp $1
 split(result,singlefile,"\n")
 for(sif in singlefile){
  if(singlefile[sif]!~/^$/){ #если не пустая строка
  sif_noext=singlefile[sif]
  gsub(/[.][^.]+$/,"",sif_noext)
  if(!conts||conts~context){icon[context][sif_noext][FNUM][type][size]=pathToTheme[FNUM] $1 "/" singlefile[sif]}
  }
 }
}

function filesArraysLinks(){ #Из строки (одной из папок темы) оздаются два массива: путь к файлу и цели, на которую он ссылается.
 if($1~/[]]$/){gsub("]","",$1)}
 if(tabledone==false){makeTable()} #создаём переменные из параметров для данной строки
 {thp=FILENAME;sub(/[^/]+$/, "", thp);pathToFiles=pathToTheme[FNUM] $1
 #cmd = "ls -gGA "thp $1 " 2>/dev/null|awk '$7{printf \"%s\", $7; if($8){print \":\" $9}else{print \":\" $7}}'";
 cmd = "ls -gGA "thp $1 " 2>/dev/null|awk '$7{printf \"%s\", $7 \":"pathToFiles"/\" $7; if($8){print \":"pathToFiles"/\" $9}else{print \":" pathToFiles "/\" $7}}'";
 #print cmd
 while ((cmd|getline result)>0)
  gsub(/\n$/,"",result) # удаляем из результата переводы строк
  #print result
  close(cmd)
 }
 split(result,singlefile,"\n") # делаем из результата массив строк по каждому отдельному файлу (file.ext:path/file.ext:path/target.ext)
 for(sif in singlefile){ # цикл по каждой строке
  split(singlefile[sif],icon_table,":") # отделяем имя от полного имени и цели
  sif_noext=icon_table[1] # присваиваем имя файла
  gsub(/[.][^.]+$/,"",sif_noext) # отрезаем расширение
  findicon[sif_noext][FNUM][size][type]=icon_table[2] # массив поиска значка по имени, номеру темы, размеру и типу (без контекста)
  #print shortcut
  #print (findicon["emblem-symbolic-link"][FNUM][size]["Fixed"] ? "<span><img src=\""findicon["emblem-symbolic-link"][FNUM][size]["Fixed"]"\"></span>" : "")
  if(!conts||conts~context){ #если переменная conts не создана, или содержит указанный контекст -- значит, если контекст не указан, то обрабатываются все контексты!
   #if(!std_icon_list||sif_noext in stdicon_name){ #Если списка нет (обрабатываются все значки), либо если значок есть в списке.
   icon[context][sif_noext][FNUM][type][size]=icon_table[2]; target[context][sif_noext][FNUM][type][size]=icon_table[3]
   #shortcut=(icon_table[2]==icon_table[3] ? "" : "<span><img src=\""icon["Emblems"]["emblem-symbolic-link"][FNUM]["Fixed"][size]"\"></span>")
   #print icon_table[2], icon_table[3]
   #print shortcut
   #}
   if(std_icon_list&&!sif_noext in stdicon_name){delete icon[context][sif_noext][FNUM][type][size]}
   #print std_icon_list, stdicon_name["folder"], sif_noext
   #print linn
   #print sif_noext
   #print "icon["context"]["sif_noext"]["FNUM"]["type"]["size"]="icon_table[2]
   #print "target["context"]["sif_noext"]["FNUM"]["type"]["size"]="icon_table[3]
  }
 }
}

function htmlTable_bak(){ #в конце
for(i in contexts){
cnt=contexts[i]
k++
if(k>1){print ""}
print cnt

for(m=1;m<=FNUM;m++){
 print ""
 print name_arr[m]
 for(j in typesSizesCont[cnt]){print cnt"/"j; printarr(typesSizesCont[cnt][j])}
}
}
}

function prepare(){ #в теле
 gsub("]","",$1) #убираем закрывающую скобку
 resetTable()
 if(tabledone==false){makeTable()} #создаём переменные из параметров для данной строки
 themeName[FNUM]=name #имя темы
 #filesTable_f()
 #filesLinksTable_f()
 #makeTable()
}

function makefiles(){
 for(ff in conts_arr){ #цикл в отфильтрованном массиве выбранных/существующих контекстов
  currentcont=conts_arr[ff]

for(prn_Type in typesCont[currentcont]){
#print typesCont[currentcont][prn_Type] " - " prn_Type
#for(egg in typesSizesCont[currentcont][prn_Type]){print toupper(prn_Type);print prn_Type " - " typesSizesCont[i][prn_Type][egg] " - " egg}
typespan[prn_Type]=length(typesSizesCont[currentcont][prn_Type])
}

  if(fldr){pwd=fldr}
  print "Создаётся \""(fldr?fldr:pwd) "/" currentcont".html\"..."
  #system ("zenity --question --text=" currentcont)
  ("if [ -f \""pwd"/"currentcont".html\" ]; then zenity --question --text=\"Заменить файл "currentcont".html?\" &&echo $?; else echo "1";fi"|getline overwrite)
  if(overwrite~"0"){
   ("rm \"" pwd "/" currentcont ".html\"")
   htmlTableFile(pwd"/"currentcont".html")
#print "\""pwd"/"currentcont".html\""
  }
  if(overwrite~"1"){
   ("rm \""pwd"/"currentcont".html\"")
   htmlTableFile(pwd"/"currentcont".html")
  }
 }
}

function htmlTableFile(context_html){ #Вывод таблиц сравнения контекстов в файлы
 if(FNUM>1){title=currentcont ":"; for(i=1; i <= FNUM; i++){title=title " " name_arr[i]}}
 else{title=currentcont " - " name " - " comment}

 print "<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>" title "</title>\n</head>" > context_html
 print "<style type=\"text/css\">" >> context_html
 print "#icon {position: relative;}" >> context_html
 print "#icon span{position:absolute;left:0;top:0;}" >> context_html
 print ".titled { text-decoration: underline; position: relative; }" >> context_html
 print ".titled .tooltip { display: none; position: absolute; top: 0; left: 0; }" >> context_html
 print ".titled:hover { cursor: pointer; }" >> context_html
 print ".titled:hover .tooltip { display: block; }" >> context_html
 print "table { border: 1px outset #EDE8DF;background:#D4D0C8;}" >> context_html
 print "table.description {border: 1px solid #333300;padding:6px;border-radius:4px;background:#FFFFE1;box-shadow: 0 0 10px rgba(0,0,0,0.5); /* Параметры тени */}" >> context_html
 print "table.description tr {border:none;background:#D4D0C8}" >> context_html
 print "table.description td {padding:5px;border:none;background:#FFFFE1}" >> context_html
 print "tr, td { border: 1px inset #EDE8DF; background:white; }" >> context_html
 print "td.dialog {border: none;background-color:#D4D0C8;}" >> context_html
 print "tr.cap td{border: 1px inset #EDE8DF;background-color:#D4D0C8;}" >> context_html
 print "td.shortcut { background-color: #EDE8DF}" >> context_html
 print "td.title { border: none; font-family: Sans; font-weight:500; background: -webkit-linear-gradient(left, #0A246A, #A6CAF0); /* Safari 5.1, iOS 5.0-6.1, Chrome 10-25, Android 4.0-4.3 */" >> context_html
 print "background: -moz-linear-gradient(left, #0A246A, #A6CAF0); /* Firefox 3.6-15 */" >> context_html
 print "background: -o-linear-gradient(left, #0A246A, #A6CAF0); /* Opera 11.1-12 */" >> context_html
 print "background: linear-gradient(to right, #0A246A, #A6CAF0); /* Opera 15+, Chrome 25+, IE 10+, Firefox 16+, Safari 6.1+, iOS 7+, Android 4.4+ */ " >> context_html
 print "color: white;" >> context_html
 print "padding: 10;}" >> context_html
 print "#title {height: 24px; font-size:19px; text-align:left; overflow:hidden;}" >> context_html
 print "#caption {text-shadow: 1px 1px 2px black, 0 0 1em #A6CAF0; font-size:39px; color:white; font-weight:bold; font-family:Sans,Sans-Serif,MS-Sans-Serif}" >> context_html
 print ".boxshadow{border: 1px solid #333300;padding:6px;border-radius:4px;background:#FFFFE1; /* Цвет фона */" >> context_html
 print "    box-shadow: 0 0 10px rgba(0,0,0,0.5); /* Параметры тени */" >> context_html
 print "    padding: 10px;" >> context_html
 print "   }" >> context_html
 print "#description {box-shadow: 0.4em 0.4em 5px rgba(122,122,122,0.5);color white}" >> context_html
 print "body {text-align:center; background-color:#3A6EA5;}" >> context_html
 print "#icontbl{box-shadow: 0.4em 0.4em 15px rgba(0,0,0,0.3);}" >> context_html
 print "</style>" >> context_html
 print "" >> context_html
 print "<body>\n<center>\n<div id=\"caption\">" currentcont "</div>"(std_icon_list?"Description from \""std_icon_list"\" list":"")"<p>" >> context_html
 i = currentcont
 print (isarray(icon[i]) ? "icon["i"] - массив" : "icon["i"] - НЕ массив")
 numic=asorti(icon[i], sorted)
 print "В контексте \""i"\" - " numic " значков."
 print (std_icon_list?"<table class=\"description\"><tr><td>"stdicon_descont[i]"</td></tr></table><p>":"") >> context_html
# print "<tr><td colspan=\"" length(sizesCont[i])*length(typesCont[i])+2 "\" class=\"title\"><div id=\"title\">" i "</div><br>"stdicon_descont[i]"</td></tr>" >> context_html #Заголовок - Контекст
 print "" >> context_html
 for(srt=1;srt<=numic;srt++){ #цикл в сортированном массиве значков
  n=sorted[srt]
if(n in stdicon_name || !std_icon_list){
  numic_print++
  #print n " - n"
  print "<table id=\"icontbl\" border=1>" >> context_html
  captionspan=length(sizesCont[i])*length(typesCont[i])+2
  print "<tr>\n<td colspan=\"" captionspan "\" class=title><div id=title>&nbsp;"n"&nbsp;</td>\n</tr>\n<tr>\n"(std_icon_list?"<td colspan=\"" captionspan "\" class=\"dialog\">"stdicon_desc[n] (tolower(stdicon_cont[n])!=tolower(currentcont)?"<br>Maybe the context of <b>\""n"\"</b> is <b>\""stdicon_cont[n]"\"</b>?":"")"</td>":"")"\n</tr>" >> context_html

#  print "<tr><td rowspan="FNUM+1" align=\"center\" valign=\"top\"><b>" n "</b>"(std_icon_list?"<br>"stdicon_desc[n](tolower(stdicon_cont[n])!=tolower(currentcont)?"<br>Maybe the context of <b>\""n"\"</b> is <b>\""stdicon_cont[n]"\"</b>?":""):"")"</td><td>Тема</td>" >> context_html #Название значка и заголовок колонки
#  print "<tr>"(std_icon_list?"<br>"stdicon_desc[n](tolower(stdicon_cont[n])!=tolower(currentcont)?"<br>Maybe the context of <b>\""n"\"</b> is <b>\""stdicon_cont[n]"\"</b>?":""):"")"</td><td>Тема</td>" >> context_html #Название значка и заголовок колонки
  print "<tr class=cap><td>Тема</td>" >> context_html
  for(prn_Type in typesCont[i]){
   #print prn_Type " - prn_Type"
   thistype=tolower(typesCont[i][prn_Type]);gsub(/^./,toupper(substr(thistype,1,1)),thistype) #Тип с заглавной буквы, потому что в makeTable был lowercase
   print "<td class=shortcut colspan=\""typespan[prn_Type]"\">"thistype"</td><!-- "length(sizesType[prn_Type])" -->" >> context_html #Типы значка  colspan=\"" length(sizesCont[i])/length(typesSizesCont[i][prn_Type]) "\"
  }
  print "</tr>" >> context_html
  #for(th in icon[i][n]){
  for(th=1;th<=FNUM;th++){
   if(th>1){print "<tr>" >> context_html}
   print "<td><div title=\""pathToTheme[th]"\" class=\"titled\" onclick=\"navigator.clipboard.writeText('" pathToTheme[th] "')\">"name_arr[th]"</div></td>" >> context_html
   #for(ty in icon[i][n][th]){#####################
   for(ty in typesCont[i]){
    asort(sizesCont[i],sizesdo)
    for(szz in sizesdo){
     s=sizesdo[szz]
     s=s+0
     if(s>96){sz=96}else{sz=s}
     #if(icon[i][name_arr[th]][th][ty][s]){
     imgfile=icon[i][n][th][ty][s]
     imgtarg=target[i][n][th][ty][s]
     imgtarg_name=imgtarg
     gsub(/.*[/$]/,"",imgtarg_name)
     gsub(/[.][^.]+$/,"",imgtarg_name)
     imgtitle=name_arr[th] "\n" i "\n" n "\n&rArr; " imgtarg_name "\n" s "x" s "\n" ty
     print typesSizesCont[i][ty][s]?"<td"(imgfile!=imgtarg ? " class=shortcut" : "")"><div id=\"icon\" ><img class=\"titled\" onclick=\"navigator.clipboard.writeText('" imgfile "')\" ondblclick=\"navigator.clipboard.writeText('" imgtarg "')\"" (imgtarg?" title=\""imgtitle"\" ":" \""s"x"s"\" ") "src=\"" icon[i][n][th][ty][s] "\" width=\""sz"\" height=\""sz"\"></div></td>":"" >> context_html #адрес и имя файла # (imgfile==imgtarg ? "" : "<span><img class=\"titled\" onclick=\"navigator.clipboard.writeText('" imgfile "')\" ondblclick=\"navigator.clipboard.writeText('" imgtarg "')\" title=\""imgtitle"\" src=\""findicon["emblem-symbolic-link"][th][s]["Fixed"]"\"></span>")
    }
   }
   print "</tr>" >> context_html
  }
 print "</table>\n<p>" >> context_html
}
 }
 print "В файл \""context_html"\" добавлено " numic_print " значков.";numic_print=0
print "</center>\n</body>\n</html>" >> context_html
}


#########################################################


BEGIN{
if(ARGC<2||ARGV[1]~/^-.*/){printHelp()}
starttime()
#sortargs()
FS="\n|\r"; RS="[\n.*][[]"; OFS=":"
if(ENVIRON["sizes"]){countsizes()}
conts_bash_f()
#conts="Applications"
chooseConts()
if(!conts){exit}
if(ARGC==2){yy="ы"}
print "Собираются данные тем" yy "..."
}


#########################################################


FNR==1{FNUM++; pathToTheme[FNUM]=getAbsPath(FILENAME)}
FNUM>1{FNUM_PREV=FNUM-1}
{for (i=2; i<=NF; i++){ # чистим от комментариев
	{sub(/[" "]*#.*$/,"",$i)
	}
}}

#/^"#"/{next}
#{str=index(/[" "]*#.*$/,$1)
#}
#/^#/{next}

!/^$/{
prepare()
filesArraysLinks()


#filesArrays()
#makeTable()

#testTheme()
#printTable()
}


#########################################################


END{
#print name, name,name,comment,example
#print icon["Stock"]["stock_people"]["2"]["Scalable"]["48"]
#printarr(conts_arr)
#print conts
#htmlTable()

#system("echo " conts_tbl)

#print conts_tbl

#printarr(conts_arr)
#printarr(stdicon_name)
getpathhere()
makefiles()
#print pwd
#print std_icon_list
if(hlp_print!="1")print "Готово!"
#ff="1 2 3 4 5 6"
#split(ff,ff_arr," ")
#for(i in ff_arr){
#print ff_arr[i]}
#printarr(conts_arr)
#print filesTable
#asort(contexts)
#print arrline(sizes)
#print arrline(contexts)

#print sizesCont["Places"]["32"]
#finishtime()
}





