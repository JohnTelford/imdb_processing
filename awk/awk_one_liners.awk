# 20 awk examples – Linux Hint
echo -e "Linux is free to use\n It is an open-source software\nLinuxHint is
 a popular blog site" | gawk '/^Linux/'

 echo -e "PHP Script\nJavaScript\nVisual Programming" | gawk '/Script$/'

# tolower($0) is used to do case insensitive search
 echo -e "Web Design\nweb development\nFramework" | gawk 'tolower($0) ~ /^web/;'

 echo -e "Linux is free to use\n It is an open-source software\nLinuxHint is
 a popular blog site" | gawk '/^Linux/'

 gawk '{ x=gensub("\t","","G",$2); printf x "+" } END{ print 0 }' salesinfo.txt | bc -l

 gawk -F '\\s\\s' '{print $1}' students.txt