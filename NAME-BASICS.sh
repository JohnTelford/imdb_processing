 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

echo "NAME-BASICS.sh"

# ln -s of IMDb datasets
source functions/data_files.sh
source functions/arguments.sh

#typeset

# return - nconst
# required parameters - primaryName, primaryProfession

# check cache
# ./imdb_dataset_cache/name_basics

# replace space with _
# primary_name=$(sed 's/ /_/' <<< $primary_name)

# # .csv file
# pn_csv=./imdb_dataset_cache/name_basics/csv_${primary_name}_name.basics
# echo $pn_csv
# # FIXME
# if  [ -s $pn_csv ]; then
#     echo "${pn_csv} exists and not empty"
# else
#      echo "${pn_csv} doesn't exist or is empty"
# fi

# #cat ${pn_csv}

# # nconst
# pn_nconst=./imdb_dataset_cache/name_basics/nconst_${primary_name}_name.basics
# FILE=$pn_nconst
# if [ -s ${pn_nconst} ]; then
#     echo "${pn_nconst} exists and not empty"
# else
#      echo "${pn_nconst} doesn't exist or is empty"
# fi

#NBASICS="/Volumes/Dev/imdb/imdb_dataset_files/name.basics.csv"
#head $NBASICS
#rg "John Wayne,1907" $NBASICS | gawk -F, '$0 ~ /actor/ ' 

# exit 1


# #show_usage

#echo "named arguments"
# nconst for actor
rg "John Wayne,\d" $NBASICS | \
   gawk -F, '{
      print $1 > "nm.csv"
   }'
cat nm.csv
# parse knownForTitles "tt*"
rg -f nm.csv $NBASICS | \
   gawk -F, '{ 
      field = NF
      for ( f = field; f >= 1 ; f--) {
         if ($f ~ /^tt/)  print $f  > "tt.csv"
      }
   }' 


  rg -f tt.csv $TBASICS | gawk -F, '{ printf "%s,%s,%s,%s,%s\n",  $1,$2, $3, $6, $9}' | xsv table
 
 cat tt.csv | rg  $TPRINCIPALS | sed 's/\[// ; s/\]// ; s/\\N// ; s/\\N$//' |
    gawk -F, '{ gsub (/\["/, "" ,$6) } {printf "%s,%s,%s,%s\n",  $2, $3, $4, $6}' | xsv table
