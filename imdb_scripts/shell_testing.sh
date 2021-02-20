#! /bin/bash

# cat "john" "wayne" | awk (1 2)

# gawk -F, ' $5 ~ /director/ { print $5 ", " }' name.basics.csv | sort -u # name.basics_primaryProfession

# gawk -F, ' $5 ~ /director/ { print $2 ", " $5  }' name.basics.csv | sort -u # name.basics_primaryProfession

# # search using rg
# rg "John Wayne,\d+," fxl_name.basics.csv | gawk -F, '$0 ~ /actor/ { print $1 }' # possible replacment for xsv searach

# rg "nm0000078,actor" fxl_title.principals.csv # possible replacement for xsv search

# rg "John Wayne,\d+," name.basics.csv | gawk -F, '$0 ~ /actor/ { print $0 }' > tmp | rg "$1,actor" fxl_title.principals.csv # possible replacement for xsv search

# printf %s%s%s, "name.basics_nconst_", ${name.basics_nconst}, ".csv"

#target=$nameBasicsNconst
#echo "$target"
#cho "$nameBasicsNconst"
# nconst=$nameBasicsNconst
# touch nameBasicsNconst
# touch nconst
# cp   nameBasicsNconst nconst

#rg "^name*" ${nameBasicsNconst} | gawk '{$1}'
#rg "^name*" nameBasicsNconst
#cmd="print"
#nconst=${nameBasicsNconst}
#echo $nconst
#eval $cmd $nconst

rg "$searchName" name.basics.csv | gawk -F, '$0 ~ /actor/ ' 

# create file - nameBaiscs_cache_"nm...".csv
#rg "^nm[0-9]+" $cache_file_tmp | gawk -F, '{print $1 "nameBasics_cache_"$1".csv"}'

#xsv select 2,3,5 nameBasics_tmp_cache.csv | gawk '{ print gensub ( / /, "_", 1 ) }' | gawk '{ print gensub ( /,/, "_", "g" ) }' > file_name

#export EDITOR /Applications/CotEditor.app